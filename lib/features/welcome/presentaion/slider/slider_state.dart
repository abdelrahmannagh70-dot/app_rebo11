part of 'slider_cubit.dart';

abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {}

class SliderSuccess extends SliderState {
  final List<SliderItem>? sliders;

  SliderSuccess(this.sliders);
}

class SliderError extends SliderState {}