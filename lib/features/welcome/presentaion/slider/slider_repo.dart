import 'package:app3/core/networking/api_endpoint.dart';
import 'package:app3/core/networking/dio_factory.dart';
import 'slider_model.dart';

class SliderRepo {
  Future<SliderModel?> getSliders() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndPoint.sliders,
      );

      if (response?.statusCode == 200) {
        return SliderModel.fromJson(response!.data);
      } else {
        return null;
      }
    } catch (e) {
      print("Slider Error: $e");
      return null;
    }
  }
}