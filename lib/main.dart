

import 'package:coba/providers/dashboard_provider.dart';

import 'package:coba/views/login_views.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (bc) => DashboardProvider()),
        ChangeNotifierProvider(create: (bc) => BeritaPanelProvider()),
      ],
      builder: (context, widget) {
        return const MaterialApp(
          home: LoginViews (),
          debugShowCheckedModeBanner: false,
        );
      }));
}
