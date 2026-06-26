import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initiateGetIt();
  runApp(DocApp());
}
