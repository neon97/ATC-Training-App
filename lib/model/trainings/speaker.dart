class Speaker {
  String? name;
  String? image;
  String? language;
  String? langImage;

  Speaker({this.name, this.image, this.language, this.langImage});

  factory Speaker.fromJson(Map<String, dynamic> json) => Speaker(
        name: json['name'] as String?,
        image: json['image'] as String?,
        language: json['language'] as String?,
        langImage: json['lang_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'language': language,
        'lang_image': langImage,
      };
}
