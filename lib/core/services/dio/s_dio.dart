import 'package:dio/dio.dart';

typedef GenericCallback = Future<T> Function<T>(T);

abstract class SDio {
  final Dio dio;

  SDio(this.dio);
}

const baseUrlDeezer = "https://api.deezer.com";
