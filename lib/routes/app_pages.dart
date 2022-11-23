
import 'package:flutter/material.dart';
import 'package:ghmc/full_gerievance_details.dart';
import 'package:ghmc/login_screen.dart';
import 'package:ghmc/login_screen_with_formfield.dart';
import 'package:ghmc/otp_screen.dart';
import 'package:ghmc/splash_screen.dart';
import 'package:ghmc/take_action_screen.dart';
import 'package:ghmc/widgets/image_picker.dart';
import 'package:ghmc/widgets/loader_reusable.dart';
import 'package:ghmc/widgets/reusable_loader.dart';
import 'package:ghmc/widgets/reusable_searchbar.dart';
import 'package:ghmc/widgets/searchbar.dart';
import 'package:image_picker/image_picker.dart';


import 'app_routes.dart';

class AllPages{
 static  Map<String,WidgetBuilder> get routes{
  return {


AllRoutes.login_screen:((context) => loginWithFormField()),
AllRoutes.otp_screen:((context) => OtpScreen()),
AllRoutes.TakeAction_Screen: ((context) => TakeActionScreen()),
AllRoutes.full_grievance_details: ((context) => FullGrievanceDetails()),
AllRoutes.s: ((context) =>test()),
  //AllRoutes.appbar: ((context) => reusableAppbar()),
  };
}
}
