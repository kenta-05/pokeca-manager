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

  factory CardData.fromMap(Map<String, dynamic> map) {
    return CardData(
      title: map['title'] ?? '',
      packName: map['packName'] ?? '',
      cost: map['cost'] ?? 0,
      imageData: map['imageData'] ?? Uint8List(0),
    );
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
