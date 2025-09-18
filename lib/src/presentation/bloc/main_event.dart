part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class MainInitEvent extends MainEvent {
  const MainInitEvent();
}

class MainChangeCountryEvent extends MainEvent {
  final String value;

  const MainChangeCountryEvent(this.value);
}

class MainChangeComplianceEvent extends MainEvent {
  final String value;

  const MainChangeComplianceEvent(this.value);
}
