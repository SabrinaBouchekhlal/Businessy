import 'package:equatable/equatable.dart';

abstract class InsightsEvent extends Equatable {
  const InsightsEvent();
  @override
  List<Object> get props => [];
}

class LoadFinancialOverviewEvent extends InsightsEvent {}

class LoadTopSoldItemsEvent extends InsightsEvent {
  final DateTime period;

  const LoadTopSoldItemsEvent({required this.period});
  @override
  List<Object> get props => [period];
}