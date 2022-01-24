import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/navigation_cubit/nav_cubit.dart';
import 'package:rickandmorty/widgets/menu_widgets/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          primaryColor: const Color.fromRGBO(36,41,47,1),
      ),
        debugShowCheckedModeBanner: false,
      title: 'Rick and Mortp',
      home:StartWidget()
    );
  }
}

class StartWidget extends StatelessWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavCubit>(
        create: (context)=>NavCubit(),
        child: MyStatefulWidget(),
    );
  }
}

