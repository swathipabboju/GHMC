
import 'package:flutter/material.dart';
import 'package:ghmc/full_gerievance_details.dart';
import 'package:ghmc/login_screen.dart';
import 'package:ghmc/login_screen_with_formfield.dart';
import 'package:ghmc/mpin_screen.dart';
import 'package:ghmc/otp_new_screen.dart';

import 'package:ghmc/sharedpreferenace.dart';
import 'package:ghmc/splash_screen.dart';
import 'package:ghmc/take_action_screen.dart';
import 'package:ghmc/using_shared.dart';
import 'package:ghmc/widgets/ReLoad.dart';
import 'package:ghmc/widgets/google_loader.dart';
import 'package:ghmc/widgets/image_picker.dart';
import 'package:ghmc/widgets/load.dart';
import 'package:ghmc/widgets/loader_reusable.dart';
import 'package:ghmc/widgets/loader.dart';
import 'package:ghmc/widgets/reusable_searchbar.dart';
import 'package:ghmc/widgets/searchbar.dart';
import 'package:image_picker/image_picker.dart';


import 'app_routes.dart';

class AllPages{
 static  Map<String,WidgetBuilder> get routes{
  return {


AllRoutes.login_screen:((context) => loginWithFormField()),
AllRoutes.otp_new_screen:((context) => OtpNewScreen()),
AllRoutes.TakeAction_Screen: ((context) => TakeActionScreen()),
AllRoutes.full_grievance_details: ((context) => FullGrievanceDetails()),
AllRoutes.s: ((context) => MyMpinDesign()),
  //AllRoutes.appbar: ((context) => reusableAppbar()),
  };
}
}
