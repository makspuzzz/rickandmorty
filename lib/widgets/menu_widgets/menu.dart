import 'package:flutter/material.dart';
import 'package:rickandmorty/bloc/navigation_cubit/nav_cubit.dart';
import 'package:rickandmorty/widgets/menu_widgets/menu_cubit_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    NavCubit characterCubit = context.read<NavCubit>();
    if(index == 0){

      characterCubit.characters();

    }
    else if(index == 1){

      characterCubit.episodes();

    }
    else{

      characterCubit.locations();

    }setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      const MenuCubit(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(36,41,47,1), // <-- This works for fixed
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.next_plan),
            label: 'Locations',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (_selectedIndex){
          _onItemTapped(_selectedIndex);
        },
      ),
    );
  }
}