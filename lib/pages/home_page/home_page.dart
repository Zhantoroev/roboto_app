import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roboto_app/repository/roboto_repo.dart';
import 'package:roboto_app/widgets/roboto_list.dart';

import 'bloc/roboto_bloc.dart';
import 'bloc/roboto_event.dart';
import 'bloc/roboto_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Roboto App"),
      ),
      body: RepositoryProvider(
        create: (context) => RobotoRepo(),
        child: BlocProvider(
          create: (context) => RobotoBloc(
            RepositoryProvider.of<RobotoRepo>(context),
          )..add(
              FecthRobotoData(),
            ),
          child: BlocBuilder<RobotoBloc, RobotoState>(
            builder: (context, state) {
              if (state is FetchedRobotoState) {
                return RobotoList(robots: state.robots);
              }

              if (state is ErrorRobotoState) {
                return Center(child: Text(state.error));
              }

              if (state is LoadingRobotoState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
