import 'package:flutter/material.dart';
import 'package:medilearnpro/modules/home/home.dart';
import 'package:medilearnpro/modules/lessons/lessons.dart';
import 'package:medilearnpro/modules/profile/profile.dart';

class BottomNavModel extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _children = [
    const Home(),
    const Lessons(),
    const Profile(),
  ];

  List<Widget> get children => _children;

  updateIndex(int index, context) {
    _currentIndex = index;
    notifyListeners();
  }
}
