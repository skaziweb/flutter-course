class Location {
  final String lat;
  final String lng;

  const Location ({
    required this.lat,
    required this.lng
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
      lat: json['lat'],
      lng: json['lng']
    );
}