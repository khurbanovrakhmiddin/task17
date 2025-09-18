import 'package:code_union_test/src/core/app_text_style.dart';
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  if (state.status == FetchStatus.success) {
                    return Text(
                      "${state.data.meta.count.toString()} stocks found",
                      style: AppTextStyle.regular.copyWith(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<MainBloc, MainState>(
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
                  } else if (state.status == FetchStatus.failure) {
                    return Center(child: Text(state.failure.message));
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
