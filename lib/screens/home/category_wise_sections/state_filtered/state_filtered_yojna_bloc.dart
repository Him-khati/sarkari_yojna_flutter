import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sarkari_yojna_flutter/screens/home/category_wise_sections/common/yojna_event.dart';
import 'package:sarkari_yojna_flutter/screens/home/category_wise_sections/common/yojna_state.dart';

class StateFilteredYojnaBloc extends Bloc<YojnaEvent, YojnaState> {
  StateFilteredYojnaBloc() : super(YojnaLoadingInitialState()) {
    on<YojnaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
