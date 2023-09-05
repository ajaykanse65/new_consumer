

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_consumer/static_data/assets_static.dart';

class HomeScreenProvider extends ChangeNotifier{

  List<String> imageUrls = [
    ImagePath.homeBanner,
    ImagePath.homeBanner,
    ImagePath.homeBanner,
    // Add more image URLs as needed
  ];


  List<String> get imageList => imageUrls;

  void goToRepairHome(BuildContext context){
    Navigator.pushNamed(context, '/repair');
    notifyListeners();
  }

  void goToShieldHome(BuildContext context){
    Navigator.pushNamed(context, '/shield');
    notifyListeners();
  }

  Future<bool> onWillPop(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit App'),
        content: const Text('Do you want to exit an App?'),
        actions:[
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            //return false when click on "NO"
            child:const Text('No'),
          ),

          ElevatedButton(
            onPressed: (){
              exit(0);
            },
            child:const Text('Yes'),
          ),
        ],
      ),
    )??false;
  }


}

