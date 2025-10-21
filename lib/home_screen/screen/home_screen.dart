import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBlocBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<HomeBlocBloc>();
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<HomeBlocBloc, HomeBlocState>(
                      builder: (context, state) {
                        if (state is ChangeState) {
                          return Text(
                            state.countValue.toString(),
                            style: TextStyle(fontSize: 20),
                          );
                        }
                        if (state is ErrorState) {
                          return Text(
                            state.msg,
                            style: TextStyle(fontSize: 20),
                          );
                        }

                        return Text(
                          "Make change",
                          style: TextStyle(fontSize: 20),
                        );
                      },
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            bloc.add(DecrementEvent());
                          },
                          child: Icon(Icons.remove),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            bloc.add(IncrementEvent());
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
