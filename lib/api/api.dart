

import 'dart:async';

import 'package:http/http.dart';

class Api {
  Future<Response> getTimeZone(String timezone) async{
     Response res = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$timezone"));
    return res; 
  }
}