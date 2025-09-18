part of 'main_bloc.dart';

enum FetchStatus { init, wait, success, failure }

class MainState extends Equatable {
  final FetchStatus status;
  final StockResponse data;
  final AppFailure failure;
  final List<String> countryFl;
  final String complianceFl;

  const MainState({
    this.countryFl = const [],
    this.complianceFl = '',
    this.failure = const AppEmptyFailure(),
    this.status = FetchStatus.init,
    this.data = const StockResponse(data: [], meta: Meta(count: 0)),
  });

  MainState copyWith({
    final List<String>? countryFl,
    final String? complianceFl,
    final FetchStatus? status,
    final StockResponse? data,
    final AppFailure? failure

  }) {
    return MainState(
      countryFl: countryFl ?? this.countryFl,
      complianceFl: complianceFl ?? this.complianceFl,
      data: data ?? this.data,
      failure: failure ?? this.failure,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status, data, countryFl,failure];
}
