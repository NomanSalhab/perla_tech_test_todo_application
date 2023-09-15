import 'package:flutter/material.dart';

bool completedSuccessfully(AsyncSnapshot snapshot) {
  return snapshot.connectionState == ConnectionState.done && snapshot.hasData;
}

bool waiting(AsyncSnapshot snapshot) {
  return snapshot.connectionState == ConnectionState.waiting;
}

bool completedWithError(AsyncSnapshot snapshot) {
  return snapshot.connectionState == ConnectionState.done &&
      (snapshot.hasError || !snapshot.hasData);
}
