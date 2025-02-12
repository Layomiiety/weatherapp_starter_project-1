import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  //varibles
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());



  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  void initState(){
    getAddress(globalController.getLatitude().value, globalController.getLongitude().value);

    super.initState();
  }

  getAddress(lat, lon) async {
    // print(lat);
    // List<Placemark> placemark = await placemarkFromCoordinates(52.2165157, 6.9437819);
    // Placemark place = placemark[0];
    // setState((){
    //   city = place.locality!;
    // });
    setState((){
      city = "Cambridge";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //location
      Container(
        margin : const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.topLeft,
        child: Text(city, style: const TextStyle(fontSize: 35, height: 2)),
      ), 
      //date
      Container(
        margin : const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        alignment: Alignment.topLeft,
        child: Text(date, style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.5)),
      )
      
    ],);
  }
}
