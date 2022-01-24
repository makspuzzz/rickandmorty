import 'package:flutter/material.dart';
import 'package:rickandmorty/bloc/character_cubit/cubit.dart';
import 'package:rickandmorty/bloc/location_cubit/location_cubit.dart';
import 'package:rickandmorty/bloc/series_cubit/series_cubit.dart';

class ErrorsWidget extends StatelessWidget {
   const ErrorsWidget({
    Key? key,required this.cubit,
  } ) : super(key: key);
  final dynamic cubit;
  final int index = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(61,62,67,1),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/1.png", width: 400, height: 240),
                    const SizedBox(height: 10,),
                    const Text("Loading error!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.w700
                      ),),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: () {
                        if(cubit is CharacterCubit||cubit is SeriesCubit||cubit is LocationsCubit){
                          cubit.get(index);}
                      },
                      child: const Text('Update', style: TextStyle(
                          color: Colors.white,
                          fontSize: 24
                      ),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const  Color.fromRGBO(34,39,45,1),),
                      ),
                    )
                  ],
                )
              ],),
            ),
          ],
        ),
      ),
    );
  }
}