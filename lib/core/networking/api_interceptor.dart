// import 'dart:math';

// import 'package:dio/dio.dart';

// class ApiInterceptor extends Interceptor {
//   ApiInterceptor();
//   @override
//   void onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     // final token = ""; // SecureStorage
//     // if (token != null && token.isNotEmpty) {
//     //   options.headers["Authorization"] = "Bearer $token";

//       ////////////////////////////////////////////////////////////////////////////////////

//       /// language for app
//       //   final lang = ""; // CacheHelper.getLanguage();
//       //   options.headers['Accept-Language'] = lang;

//       /////////////////////////////////////////////////////////////////////////////////////

//       /// device type
//       /// Platform.operatingSystem نقدر نجيب نوع الجهاز من خلال الكود دا
//       /// options.headers['Platform'] =  Platform.operatingSystem; نبعت نوع الجهاز لل api من خلال داا  (device_info_plus: this packadge for more info about device)
//     }
//     handler.next(options);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     handler.next(response);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     if (err.response?.statusCode == 401) {
//       final accessToken = "";

//       /// SecureStorage
//       final refreshToken = "";

//       /// SecureStorage

//       if (refreshToken == null) {
//         handler.next(err);
//         return;
//       } else {
//         final response = await Dio().post(
//           '/refresh-token',
//           data: {'refreshToken': refreshToken},
//         );
//         final newAccessToken = response.data["accessToken"];
//         final newrefreshToken = response.data["refreshToken"];
//         // await SecureStorageHelper.instance.saveTokens( واحفظ ال رجع فوق دا

//         final reqeustOptions = err
//             .requestOptions; // بقوله هات الطلب القديم ال اتسبب في ان يبان ال 401

//         reqeustOptions.headers["Authorization"] = "Bearer $newAccessToken";

//         /// اعمل اعاده للطلب من جديد
//         final retryResponse = await Dio().fetch(reqeustOptions);

//         handler.resolve(retryResponse);
//       }
//     }

//     return;
//   }
// }
