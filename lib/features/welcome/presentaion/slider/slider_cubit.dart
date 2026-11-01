import 'package:bloc/bloc.dart';
import 'slider_model.dart';
import 'slider_repo.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  Future<void> getSliders() async {
    emit(SliderLoading());

    final response = await SliderRepo().getSliders();

    if (response != null) {
      emit(SliderSuccess(response.data?.sliders));
    } else {
      emit(SliderError());
    }
  }
}