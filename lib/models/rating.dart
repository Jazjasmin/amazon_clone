import 'dart:convert';

class Rating {
  final String userId;
  final double raring;
  Rating({required this.userId, required this.raring});

  Map<String, dynamic> toMap(){
    return {
      'userId': userId,
      'rating': raring,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'] ?? '', 
    raring: map['rating'] ?? 0.0
    );
  } 

  String toJson() => json.encode(toMap());
  factory Rating.fromJson(String source) => Rating.fromJson(json.decode(source));
}