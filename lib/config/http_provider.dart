import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'http_provider.g.dart';

@riverpod
 Dio http(HttpRef ref) {
   final options = BaseOptions(
    baseUrl: 'https://635017b9df22c2af7b630c3e.mockapi.io',
    //connectTimeout: Duration(seconds: 5),
   // receiveTimeout: Duration(seconds: 3),
  );
  return Dio(options) ;
}