import 'dart:convert';

class TattooDesign {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String creatorId; // ID of the user who created the design
  final List<String> tags; // Tags associated with the design

  TattooDesign({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.creatorId,
    required this.tags,
  });

  // Method to convert a TattooDesign object to a map (useful for serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'creatorId': creatorId,
      'tags': tags,
    };
  }

  // Method to create a TattooDesign object from a map (useful for deserialization)
  factory TattooDesign.fromMap(Map<String, dynamic> map) {
    return TattooDesign(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      creatorId: map['creatorId'],
      tags: List<String>.from(map['tags']),
    );
  }

  // Method to create a TattooDesign object from a JSON string
  factory TattooDesign.fromJson(String source) =>
      TattooDesign.fromMap(json.decode(source));

  // Method to convert a TattooDesign object to a JSON string
  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'TattooDesign{id: $id, title: $title, description: $description, imageUrl: $imageUrl, creatorId: $creatorId, tags: $tags}';
  }
}
