class Deadline {
  String? timings;
  String? dates;
  String? place;
  String? location;

  Deadline({this.timings, this.dates, this.place, this.location});

  factory Deadline.fromJson(Map<String, dynamic> json) => Deadline(
        timings: json['timings'] as String?,
        dates: json['dates'] as String?,
        place: json['place'] as String?,
        location: json['location'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'timings': timings,
        'dates': dates,
        'place': place,
        'location': location,
      };
}
