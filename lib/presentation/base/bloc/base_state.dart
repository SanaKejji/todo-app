part of 'base_cubit.dart';

class BaseState {
  const BaseState({this.currentStep = 0});
  final int currentStep;

  BaseState copyWith({
    int? currentStep,
  }) {
    return BaseState(
      currentStep: currentStep ?? this.currentStep,
    );
  }
}
