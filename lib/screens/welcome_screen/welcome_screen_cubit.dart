import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarkari_yojna_flutter/data/repositories/yojna_repository.dart';
import 'package:sarkari_yojna_flutter/screens/welcome_screen/welcom_screen_state.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';

class WelcomeScreenCubit extends Cubit<WelcomeScreenStateAndEffect> {
  static const tag = "WelcomeScreenCubit";

  final YojnaRepository yojnaRepository;
  final Logger logger;

  WelcomeScreenCubit({
    required this.yojnaRepository,
    required this.logger,
  }) : super(WelcomeScreenProcessingState()) {
    _updateStoredYojna(
      forceUpdate: false,
    );
  }

  void retryUpdateDatabase() {
    _updateStoredYojna(
      forceUpdate: true,
    );
  }

  void skip() {}

  void _updateStoredYojna({
    required bool forceUpdate,
  }) async {
    logger.i(tag, "Updating Stored Yojna");

    try {
      await yojnaRepository.updateYojna(forceUpdate: forceUpdate);
    } catch (error) {
      logger.e(
        tag,
        "error updating yojna",
        error,
      );
    }

    emit(WelcomeScreenNavigateEffect("/home"));
  }

  @override
  Future<void> close() {
    logger.i(
      tag,
      "Closing Cubit.."
    );
    return super.close();
  }

}
