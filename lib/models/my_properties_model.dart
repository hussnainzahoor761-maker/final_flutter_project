class MyPropertyItem {
  final int id;
  final String title;
  final String location;
  final String status;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final String currency;

  const MyPropertyItem({
    required this.id,
    required this.title,
    required this.location,
    required this.status,
    required this.price,
    required this.imageUrl,
    required this.isFavorite,
    required this.currency,
  });

  factory MyPropertyItem.fromJson(Map<String, dynamic> json) {
    final dynamic rawImages =
        json['imageUrls'] ?? json['images'] ?? json['imageUrl'];
    final List<String> images = [];

    if (rawImages is List) {
      for (final item in rawImages) {
        if (item is String && item.trim().isNotEmpty) {
          images.add(item.trim());
        }
      }
    } else if (rawImages is String && rawImages.trim().isNotEmpty) {
      images.add(rawImages.trim());
    }

    final location =
        (json['locationLabel'] ??
                json['location'] ??
                json['address'] ??
                json['city'] ??
                '')
            .toString();

    final status =
        (json['status'] ?? json['listingStatus'] ?? json['state'] ?? 'Active')
            .toString();

    final priceValue = json['price'];
    final priceLabel = json['priceLabel']?.toString();

    String priceText;
    if (priceLabel != null && priceLabel.trim().isNotEmpty) {
      priceText = priceLabel;
    } else if (priceValue != null) {
      priceText = priceValue.toString();
    } else {
      priceText = 'N/A';
    }

    final currency = (json['currency'] ?? 'USD').toString();

    return MyPropertyItem(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: (json['title'] ?? json['name'] ?? 'Untitled property').toString(),
      location: location.isNotEmpty ? location : 'Unknown location',
      status: status,
      price: priceText,
      imageUrl: images.isNotEmpty ? images.first : '',
      isFavorite: json['isFavorite'] as bool? ?? false,
      currency: currency,
    );
  }
}

class MyPropertiesPage {
  final List<MyPropertyItem> items;
  final bool hasNext;

  const MyPropertiesPage({required this.items, required this.hasNext});

  factory MyPropertiesPage.fromJson(Map<String, dynamic> json) {
    final rawItems =
        json['items'] ??
        json['data'] ??
        json['content'] ??
        json['properties'] ??
        const [];
    final List<dynamic> list = rawItems is List ? rawItems : [rawItems];

    return MyPropertiesPage(
      items: list
          .whereType<Map<String, dynamic>>()
          .map(MyPropertyItem.fromJson)
          .toList(),
      hasNext: json['hasNext'] as bool? ?? false,
    );
  }
}
