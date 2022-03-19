import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nco_app/styles/text_styles.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  late String _timeString;
  late String _dateString;

  @override
  void initState() {
    // TODO: implement initState
    _timeString = _formatTime(DateTime.now());
    _dateString = _formatDate(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_timeString,
                  style: GoogleFonts.zcoolQingKeHuangYou(
                    textStyle: clockTime
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0,),
            Text(_dateString,
              style: GoogleFonts.zcoolQingKeHuangYou(
                textStyle: clockDate
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now(), today = DateTime.now();
    final String formatTime = _formatTime(now), formatDate = _formatDate(today);
    setState(() {
      _timeString = formatTime;
      _dateString = formatDate;
    });
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH : mm').format(dateTime);
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('MM / dd / yyyy').format(dateTime);
  }
  
}