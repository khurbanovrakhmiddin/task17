import 'package:bloc/bloc.dart';
import 'package:code_union_test/src/data/model/failure.dart';
import 'package:code_union_test/src/data/model/response.dart';
import 'package:code_union_test/src/domain/usecase/get_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetListUseCase useCase;

  MainBloc(this.useCase) : super(MainState()) {
    on<MainChangeCountryEvent>((event, emit) {
      emit(state.copyWith(countryFl: [event.value, ...state.countryFl]));
    });
    on<MainChangeComplianceEvent>((event, emit) {
      emit(state.copyWith(complianceFl: event.value));
    });
    on<MainInitEvent>((event, emit) async {
      final result = await useCase.call();

      print(result.isRight());
      emit(
        result.fold(
          (l) => state.copyWith(status: FetchStatus.failure, failure: l),
          (r) => state.copyWith(status: FetchStatus.success, data: r),
        ),
      );
    });
  }
}
