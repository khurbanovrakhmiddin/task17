import 'package:code_union_test/src/data/repository/get_repo_impl.dart';
import 'package:code_union_test/src/data/request/data_soruce_impl.dart';
import 'package:code_union_test/src/domain/usecase/get_list_usecase.dart';
import 'package:code_union_test/src/presentation/bloc/main_bloc.dart';
import 'package:code_union_test/src/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final ds = StockDataSourceImpl();
  final repo = GetRepoImpl(ds);
  final useCase = GetListUseCase(repo);

  runApp(MyApp(useCase: useCase));
}

class MyApp extends StatelessWidget {
  final GetListUseCase useCase;

  const MyApp({super.key, required this.useCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainBloc(useCase)..add(const MainInitEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MainPage(),
      ),
    );
  }
}
