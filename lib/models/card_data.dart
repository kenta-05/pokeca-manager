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

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      title: json['title'],
      packName: json['packName'],
      image: json['image'],
      url: json['url'],
    );
  }
}
