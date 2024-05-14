import 'package:airplane/models/destination_model.dart';
import 'package:airplane/services/destination_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destinations_state.dart';

class DestinationsCubit extends Cubit<DestinationsState> {
  DestinationsCubit() : super(DestinationsInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations =
          await DestinationService().fetchDestinations();
      emit(DestinationSuccess(destinations: destinations));
    } catch (e) {
      emit(DestinationFailed(error: e.toString()));
    }
  }
}
