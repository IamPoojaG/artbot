import 'package:flutter_application_1/models/tattoo_design.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TattooDesign', () {
    test('Create TattooDesign', () {
      final tattooDesign = TattooDesign(
        id: '1',
        title: 'Dragon Tattoo',
        description: 'A fierce dragon tattoo design',
        imageUrl: 'https://example.com/dragon_tattoo.jpg',
        creatorId: 'user123',
        tags: ['dragon', 'mythical'],
      );

      expect(tattooDesign.id, '1');
      expect(tattooDesign.title, 'Dragon Tattoo');
      expect(tattooDesign.description, 'A fierce dragon tattoo design');
      expect(tattooDesign.imageUrl, 'https://example.com/dragon_tattoo.jpg');
      expect(tattooDesign.creatorId, 'user123');
      expect(tattooDesign.tags, ['dragon', 'mythical']);
    });

    test('Serialize and Deserialize TattooDesign', () {
      final tattooDesign = TattooDesign(
        id: '2',
        title: 'Rose Tattoo',
        description: 'A beautiful rose tattoo design',
        imageUrl: 'https://example.com/rose_tattoo.jpg',
        creatorId: 'user456',
        tags: ['rose', 'flower'],
      );

      final json = tattooDesign.toJson();
      final fromJson = TattooDesign.fromJson(json);

      expect(fromJson.id, tattooDesign.id);
      expect(fromJson.title, tattooDesign.title);
      expect(fromJson.description, tattooDesign.description);
      expect(fromJson.imageUrl, tattooDesign.imageUrl);
      expect(fromJson.creatorId, tattooDesign.creatorId);
      expect(fromJson.tags, tattooDesign.tags);
    });
  });
}
