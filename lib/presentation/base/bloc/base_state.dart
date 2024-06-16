part of 'base_cubit.dart';

class BaseState {
  const BaseState({
    this.currentStep = 0,
    this.userData,
  });
  final int currentStep;
  final User? userData;

  BaseState copyWith({
    int? currentStep,
    User? userData,
  }) {
    return BaseState(
      currentStep: currentStep ?? this.currentStep,
      userData: userData ?? this.userData,
    );
  }
}
