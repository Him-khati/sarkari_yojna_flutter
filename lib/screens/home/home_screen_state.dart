part of 'home_screen_cubit.dart';

sealed class HomeScreenBlocState extends Equatable {
  const HomeScreenBlocState();
}

final class HomeScreenBlocInitial extends HomeScreenBlocState {
  @override
  List<Object> get props => [];
}

final class HomeScreenContentChanged extends HomeScreenBlocState {
  final HomeScreenLayoutConfig config;

  const HomeScreenContentChanged({
    required this.config,
  });

  @override
  List<Object> get props => [config];
}

final class ErrorLoadingHomeScreenConfig extends HomeScreenBlocState {
  final String error;
  final bool showRetry;

  const ErrorLoadingHomeScreenConfig({
    required this.error,
    this.showRetry = true,
  });

  @override
  List<Object> get props => [];
}
