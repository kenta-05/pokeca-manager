class CardData {
  String title;
  String packName;
  String image;
  String url;

  CardData({
    required this.title,
    required this.packName,
    required this.image,
    required this.url,
  });

  CardData copyWith(
      {String? title, String? packName, String? image, String? url}) {
    return CardData(
      title: title ?? this.title,
      packName: packName ?? this.packName,
      image: image ?? this.image,
      url: url ?? this.url,
    );
  }

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      title: json['title'],
      packName: json['packName'],
      image: json['image'],
      url: json['url'],
    );
  }
}
