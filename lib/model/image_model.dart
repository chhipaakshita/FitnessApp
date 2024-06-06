class ImageModel{
  String? title;
  String url;

  ImageModel({
    required this.title,
    required this.url
});
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        title: json['title'],
        url: json['url'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
    };
  }
}