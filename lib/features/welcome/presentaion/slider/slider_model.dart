class SliderModel {
  SliderData? data;

  SliderModel({this.data});

  SliderModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null
        ? null
        : SliderData.fromJson(json["data"]);
  }
}

class SliderData {
  List<SliderItem>? sliders;

  SliderData({this.sliders});

  SliderData.fromJson(Map<String, dynamic> json) {
    sliders = json["sliders"] == null
        ? []
        : (json["sliders"] as List)
        .map((e) => SliderItem.fromJson(e))
        .toList();
  }
}

class SliderItem {
  String? image;

  SliderItem({this.image});

  SliderItem.fromJson(Map<String, dynamic> json) {
    image = json["image"]?.toString();
  }
}