
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/location_cubit/location_cubit.dart';
import 'package:rickandmorty/bloc/location_cubit/location_states.dart';
import 'package:rickandmorty/services/location_services/location_reprository.dart';
import 'package:rickandmorty/widgets/Indicator.dart';
import 'package:rickandmorty/widgets/error.dart';
import 'package:rickandmorty/widgets/location_widgets/location_list.dart';

class InfoSeriesWidget extends StatelessWidget {
  InfoSeriesWidget({Key? key}) : super(key: key);

  int page = 1;

  @override
  Widget build(BuildContext context) {
    LocationsCubit locationsCubit = context.read<LocationsCubit>();
    final ScrollController _controller = ScrollController();
    return BlocBuilder<LocationsCubit,LocationsState>(builder: (context,state){
      if(state is LocationsLoadetState) {
        return Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (notification){
                  if(notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent){
                    page++;
                    locationsCubit.getLoadPage(page,state.loadetLocations);
                  }
                  return true;
                },
                child:ListView.builder(
                    itemCount: state.loadetLocations.length,
                    itemBuilder:(context,index){
                      return
                        LocationWidget(index: index, listLocations: state.loadetLocations,);
                    }
                ),
              ),
            )],
        );
      }
      if(state is LocationsLoadingState){
        return const Center(child: IndicatorLoad());
      }
      if(state is LocationsErorState){
        LocationsCubit characterCubit = context.read<LocationsCubit>();
        return ErrorsWidget(cubit: characterCubit);
      }
      return Container();
    }

    );
  }
}

class ListLocation extends StatelessWidget {
  const ListLocation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)  {
    final _locationRepository = LocationsRepository();
    return BlocProvider<LocationsCubit>(
        create: (context)=>LocationsCubit(locationRepository: _locationRepository),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("The Rick and Morty locations"),
              backgroundColor: const Color.fromRGBO(36,41,47,1),
            ),
            backgroundColor: const Color.fromRGBO(34,39,45,1),
            body: const LocationBufCubit()
        ));
  }
}


class LocationBufCubit extends StatelessWidget {
  const LocationBufCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocationsCubit locationsCubit = context.read<LocationsCubit>();
    locationsCubit.get(0);
    return InfoSeriesWidget();
  }
}