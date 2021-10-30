import 'deadline.dart';
import 'speaker.dart';

class Trainig {
  String? name;
  String? image;
  Deadline? deadline;
  String? price;
  String? currency;
  String? newPrice;
  String? status;
  String? ratings;
  Speaker? speaker;

  Trainig({
    this.name,
    this.image,
    this.deadline,
    this.price,
    this.currency,
    this.newPrice,
    this.status,
    this.ratings,
    this.speaker,
  });

  factory Trainig.fromJson(Map<String, dynamic> json) => Trainig(
        name: json['name'] as String?,
        image: json['image'] as String?,
        deadline: json['deadline'] == null
            ? null
            : Deadline.fromJson(json['deadline'] as Map<String, dynamic>),
        price: json['price'] as String?,
        currency: json['currency'] as String?,
        newPrice: json['new_price'] as String?,
        status: json['status'] as String?,
        ratings: json['ratings'] as String?,
        speaker: json['speaker'] == null
            ? null
            : Speaker.fromJson(json['speaker'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'deadline': deadline?.toJson(),
        'price': price,
        'currency': currency,
        'new_price': newPrice,
        'status': status,
        'ratings': ratings,
        'speaker': speaker?.toJson(),
      };
}
