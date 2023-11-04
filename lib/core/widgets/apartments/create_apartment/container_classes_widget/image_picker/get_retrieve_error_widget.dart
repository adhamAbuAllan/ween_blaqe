import 'package:flutter/material.dart';

Text? getRetrieveErrorWidget(String retrieveDataError) {
  final Text result = Text(retrieveDataError);
  retrieveDataError = "";
  return result;
}
