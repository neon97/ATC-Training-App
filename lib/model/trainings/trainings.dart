import 'trainig.dart';

class Trainings {
  List<Trainig>? trainigs;

  Trainings({this.trainigs});

  factory Trainings.fromJson(Map<String, dynamic> json) => Trainings(
        trainigs: (json['trainings'] as List<dynamic>?)
            ?.map((e) => Trainig.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'trainings': trainigs?.map((e) => e.toJson()).toList(),
      };
}
