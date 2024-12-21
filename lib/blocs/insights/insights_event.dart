import 'package:equatable/equatable.dart';

abstract class InsightsEvent extends Equatable {
  const InsightsEvent();

  @override
<<<<<<< HEAD
  List<Object?> get props => [];
}
class LoadInsights extends InsightsEvent {}
=======
  List<Object> get props => [];
}
class LoadWeeklySalesData extends InsightsEvent {}

class LoadTopSoldItems extends InsightsEvent {}
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
