import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// 2. main 함수를 비동기(async)로 바꾸고 금고를 로드(load)합니다.
Future main() async {
  // 앱 실행 전에 미리 세팅이 필요할 때 필수로 적는 코드
  WidgetsFlutterBinding.ensureInitialized();

  // 3. 비밀 금고(.env 파일) 열기!
  await dotenv.load(fileName: ".env");

  runApp(TestMap2());
}

class TestMap2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapCtrl;
  LatLng? _initPosition;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initPosition = LatLng(position.latitude, position.longitude);
      _markers.add(Marker(
        markerId: MarkerId('1'),
        position: _initPosition!,
        icon: BitmapDescriptor.defaultMarker,
      ));
      _fetchNearbyPlaces(position.latitude, position.longitude);
    });
  }

  Future<void> _fetchNearbyPlaces(double latitude, double longitude) async {
    Dio dio = Dio();

    // Google Places API 호출
    String apiKey = dotenv.env['GOOGLE_API_KEY'] ?? '키가 없습니다'; // api key
    String url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&type=restaurant&key=$apiKey";

    try {
      Response response = await dio.get(url);
      List<dynamic> results = response.data['results'];
      Map<String, dynamic> map = {};
      for(int i=0; i<results.length; i++){
        map = results[i];
        double lat = map['geometry']['location']['lat'];
        double lng = map['geometry']['location']['lng'];
        String name = map['name'];

        _markers.add(Marker(
          markerId: MarkerId(name),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: name),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        ));
      };
      setState(() {});
    } catch (e) {
      print("Error fetching nearby places: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google 지도'),
      ),
      body: _initPosition == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapCtrl = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: _initPosition!,
          zoom: 14,
        ),
        markers: _markers,
      ),
    );
  }
}