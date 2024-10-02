import 'dart:convert';

import 'package:flutter/material.dart';

String getBasicAuthString() {
  String basicAuth =
      'Basic ${base64.encode(utf8.encode('wsSpServicosUser:%\$S9p8S7e6r5v4i3c2o1s\$%'))}';
  debugPrint(basicAuth);
  return basicAuth;    
}