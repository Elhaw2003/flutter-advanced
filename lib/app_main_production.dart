import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di.dart';
import 'package:flutter_advanced/core/helper/cash/secure_storage_caching.dart';
import 'package:flutter_advanced/core/helper/cash/secure_storage_keys.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await initiateGetIt();
  await checkLogged();
  runApp(DocApp());
}

Future<void> checkLogged() async {
  isLogged = await sl<SecureStorageCaching>().isLoggedIn();
}
