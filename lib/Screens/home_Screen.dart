import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/working_Class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void loadData() async {
    working instance = working('karachi');
    await instance.getData();
    print(instance.main);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
