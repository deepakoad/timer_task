import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surat_project/src/view/splash_screen.dart';
import 'src/view/home_screen.dart';
import 'src/viewmodel/post_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PostViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),),
    ),
  );
}
