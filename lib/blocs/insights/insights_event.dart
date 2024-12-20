import 'package:equatable/equatable.dart';

abstract class InsightsEvent extends Equatable {
  const InsightsEvent();

  @override
  List<Object> get props => [];
}
class LoadWeeklySalesData extends InsightsEvent {}

class LoadTopSoldItems extends InsightsEvent {}
