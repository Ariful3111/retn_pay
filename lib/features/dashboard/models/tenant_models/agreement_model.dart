import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgreementPartBServiceModel {
  final String title;
  final TextEditingController controller;
  final RxBool isYes;
  final RxBool isNo;

  AgreementPartBServiceModel({
    required this.title,
    required this.controller,
    required this.isYes,
    required this.isNo,
  });
}
