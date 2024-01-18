import 'dart:typed_data';

class CardData {
  String title;
  String packName;
  int cost;
  Uint8List? imageData;

  CardData({
    required this.title,
    required this.packName,
    required this.cost,
    this.imageData,
  });

  CardData copyWith(
      {String? title, String? packName, int? cost, Uint8List? imageData}) {
    return CardData(
      title: title ?? this.title,
      packName: packName ?? this.packName,
      cost: cost ?? this.cost,
      imageData: imageData ?? this.imageData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'packName': packName,
      'cost': cost,
      'imageData': imageData,
    };
  }

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      title: json['title'],
      packName: json['packName'],
      cost: json['cost'],
      imageData: json['imageData'],
    );
  }
}
