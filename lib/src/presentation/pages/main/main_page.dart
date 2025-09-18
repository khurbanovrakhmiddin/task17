import 'package:code_union_test/src/presentation/bloc/main_bloc.dart';
import 'package:code_union_test/src/presentation/pages/main/stock_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        buildWhen: (prev, cur) => prev.status != cur.status,
        builder: (context, state) {
          if (state.status == FetchStatus.success) {
            final list = state.data.data;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final data = list[index];
                return StockTile(data: data);
              },
            );
          } else if (state.status == FetchStatus.wait) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return SizedBox.shrink();
              },
            );
          }

         else if(state.status ==FetchStatus.failure){
            return Text(state.failure.message);

          }
         return SizedBox.shrink();
        },
      ),
    );
  }
}
