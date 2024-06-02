import 'package:cloud_firestore/cloud_firestore.dart';

class Design {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  Design(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory Design.fromMap(Map<String, dynamic> map, String documentId) {
    return Design(
      id: documentId,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}

class DesignLibraryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'designs';

  Future<void> addDesign(Design design) async {
    await _firestore.collection(_collectionPath).add(design.toMap());
  }

  Future<void> updateDesign(Design design) async {
    await _firestore
        .collection(_collectionPath)
        .doc(design.id)
        .update(design.toMap());
  }

  Future<void> deleteDesign(String designId) async {
    await _firestore.collection(_collectionPath).doc(designId).delete();
  }

  Stream<List<Design>> getDesigns() {
    return _firestore.collection(_collectionPath).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Design.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  Future<Design?> getDesignById(String designId) async {
    final doc =
        await _firestore.collection(_collectionPath).doc(designId).get();
    if (doc.exists) {
      return Design.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    } else {
      return null;
    }
  }
}
