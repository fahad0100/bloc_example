import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen/bloc/home_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBlocBloc, HomeBlocState>(
        builder: (context, state) {
          return Center(child: Text('Hello World!'));
        },
      ),
    );
  }
}
