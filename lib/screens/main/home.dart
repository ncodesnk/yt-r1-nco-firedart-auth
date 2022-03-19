import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:nco_app/services/firebase_auth_service.dart';
import 'package:nco_app/styles/colors/colors.dart';

import '../../styles/container_styles.dart';
import '../auth/auth_home.dart';
import '../clock/clock.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var logger = Logger();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();
  bool _isSignedIn = false;
  String _userId = "";
  String _userMail = "";
  String _userName = "";

  @override
  void initState() {
    // TODO: implement initState
    setUSerActionMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          if (_isSignedIn)
          PopupMenuButton(
            icon: const Icon(Icons.account_box_rounded),
            color: spaceGray,
            elevation: 50.0,
            shape: OutlineInputBorder(
              borderSide: BorderSide(
                color: color3,
                width: 2.0
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))
            ),
            onSelected: (value) {},
            itemBuilder: (BuildContext buuilcontext) {
              return [
                PopupMenuItem(
                  child: Text("You are signed in as $_userName" ),
                ),
                PopupMenuItem(
                  onTap: () {
                    dynamic result =  _firebaseAuthService.signOut();
                      _firebaseAuthService.signInState().then((value) => {
                        setState(() {
                          _isSignedIn = value;
                        }),
                      });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                          decoration: userActionMenuItem,
                          child: const Text("Sign out"),
                        ),
                      ),
                    ],
                  )
                ),
              ];
            },
          )
          else
          IconButton(
            onPressed: () {
              getToAuthScreen();
            },
            icon: const Icon(
              Icons.person_rounded,
            )
          )
        ],
      ),
      body: const Clock(title: 'Clock')
    );
  }

  getToAuthScreen() {
    Get.to(const AuthHome(title: 'Get start with Nco'));
  }

  setUSerActionMenu() {
    _firebaseAuthService.signInState().then((value) => {
      setState(() {
        _isSignedIn = value;
        if (_isSignedIn) {
          _firebaseAuthService.currentUser().then((value) => {
            setState(() {
              _userId = value.id;
              _userMail = value.email;
              final emailArray = _userMail.split('@');
              _userName = emailArray[0];
            }),
          });
        }
      }),
    });
  }
}