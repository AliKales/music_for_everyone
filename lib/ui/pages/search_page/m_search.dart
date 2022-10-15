import '../../../core/services/dio/dio_charts.dart';
import 'package:equatable/equatable.dart';

class MSearch extends Equatable {
  const MSearch({this.query, this.chart = Chart.tracks});

  final String? query;
  final Chart? chart;

  @override
  List<Object?> get props => [query, chart];
}
