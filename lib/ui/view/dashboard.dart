import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  GoogleMapController mapController;
  double lat = 28.638732;
  double long = 77.4698628;
  Position position;

  void getCurrentLoc() {
    Future<Position> pos =
        Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    pos.then((_) {
      position = _;
      lat = position?.latitude;
      long = position?.longitude;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLoc();
    super.initState();
  }

  void onMapCreated(GoogleMapController controller) async {
    String mapStyle = await getJsonFile('assets/map_design.json');
    mapController = controller;
    mapController.setMapStyle(mapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          'Mitul Gautam',
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Do more with ypur account',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Make money driving',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Your Trips',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Help',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Payment',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Free Rides',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Divider(
                      color: Colors.black54,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Get food delivery',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Legal',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 7,
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    GoogleMap(
                      onMapCreated: onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(lat, long),
                      ),
                      minMaxZoomPreference: MinMaxZoomPreference(13.0, 13.0),
                      myLocationEnabled: false,
                      compassEnabled: false,
                      myLocationButtonEnabled: false,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.all(16.0),
                          child: IconButton(
                            icon: CircleAvatar(
                              child: Icon(
                                Icons.my_location,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              print('Home');
//                              lat = position.latitude;
//                              long = position.longitude;
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                      color: Colors.grey[300],
                      child: ListTile(
                        title: Text(
                          "Where to?",
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
                      child: ListTile(
                        title: Text(
                          "Choose a saved place",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(
                          Icons.stars,
                          size: 48.0,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                      onPressed: () => scaffoldKey.currentState.openDrawer()),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 0.0, bottom: 0.0),
                        color: Colors.black,
                        shape: StadiumBorder(),
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                            text: 'Uber ',
                          ),
                          TextSpan(
                              text: 'Eats',
                              style: TextStyle(color: Colors.green)),
                        ], style: TextStyle(fontWeight: FontWeight.bold))),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
