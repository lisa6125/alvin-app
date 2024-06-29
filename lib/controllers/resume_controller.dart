import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ResumeController extends GetxController {
  var personalInfo = {}.obs;
  var education = [].obs;
  var highlights = [].obs;
  var experience = [].obs;
  var salary = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadResumeData();
  }

  void loadResumeData() async {
    final String response = await rootBundle.loadString('assets/resume_data.json');
    final data = await json.decode(response);
    personalInfo.value = data['personal_info'];
    education.value = data['education'];
    highlights.value = data['highlights'];
    experience.value = data['experience'];
    salary.value = data['salary'];
  }
}