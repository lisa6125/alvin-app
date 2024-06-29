import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_me_data.dart';
import 'controllers/resume_controller.dart';

class ResumePage extends StatelessWidget {
  final ResumeController resumeController = Get.put(ResumeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Obx(() => _buildHeader(context)),
            SizedBox(height: 16.0),
            _buildSectionTitle('Education'),
            Obx(() => _buildEducationSection()),
            SizedBox(height: 16.0),
            _buildSectionTitle('Highlights'),
            Obx(() => _buildHighlightsSection()),
            SizedBox(height: 16.0),
            _buildSectionTitle('Experience'),
            Obx(() => _buildExperienceSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          resumeController.personalInfo['name'] ?? '',
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        Text(
          'iOS Developer',
          style: TextStyle(fontSize: 20.0, color: Colors.teal),
        ),
        SizedBox(height: 8.0),
        AboutMeData(
          data: 'Email',
          information: resumeController.personalInfo['email'] ?? '',
        ),
        AboutMeData(
          data: 'Phone',
          information: resumeController.personalInfo['phone'] ?? '',
        ),
        AboutMeData(
          data: 'Residence',
          information: resumeController.personalInfo['residence'] ?? '',
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.teal),
    );
  }

  Widget _buildEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resumeController.education.map((edu) {
        return AboutMeData(
          data: edu['degree'] ?? '',
          information: "${edu['institution'] ?? ''}, ${edu['period'] ?? ''}",
        );
      }).toList(),
    );
  }

  Widget _buildHighlightsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resumeController.highlights.map((highlight) {
        return AboutMeData(
          data: 'Highlight',
          information: highlight,
        );
      }).toList(),
    );
  }

  Widget _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: resumeController.experience.map((exp) {
        return AboutMeData(
          data: exp['title'] ?? '',
          information: "${exp['company'] ?? ''}, ${exp['period'] ?? ''}\n${exp['description'] ?? ''}",
        );
      }).toList(),
    );
  }
}