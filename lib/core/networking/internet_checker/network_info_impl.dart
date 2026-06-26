import 'package:flutter_advanced/core/networking/internet_checker/network_info.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection connection;

  NetworkInfoImpl(this.connection);
  @override
  Future<bool> get isConnected async => await connection.hasInternetAccess;
}
