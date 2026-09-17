class PropertyListingDraft {
  final int? id;
  final String title;
  final String type;
  final String status;
  final String location;
  final String city;
  final String country;
  final num price;
  final int bedrooms;
  final int bathrooms;
  final int areaSqft;
  final String description;

  const PropertyListingDraft({
    this.id,
    required this.title,
    required this.type,
    required this.status,
    required this.location,
    required this.city,
    required this.country,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.areaSqft,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'status': status,
      'locationLabel': location,
      'city': city,
      'country': country,
      'price': price,
      'beds': bedrooms,
      'baths': bathrooms,
      'areaSqft': areaSqft,
      'description': description,
    };
  }

  factory PropertyListingDraft.fromJson(Map<String, dynamic> json) {
    return PropertyListingDraft(
      id: json['id'] as int?,
      title: (json['title'] ?? json['name'] ?? '').toString(),
      type: (json['type'] ?? '').toString(),
      status: (json['status'] ?? '').toString(),
      location: (json['locationLabel'] ?? json['location'] ?? '').toString(),
      city: (json['city'] ?? '').toString(),
      country: (json['country'] ?? '').toString(),
      price: (json['price'] as num?) ?? 0,
      bedrooms: (json['beds'] as num?)?.toInt() ?? 0,
      bathrooms: (json['baths'] as num?)?.toInt() ?? 0,
      areaSqft: (json['areaSqft'] as num?)?.toInt() ?? 0,
      description: (json['description'] ?? '').toString(),
    );
  }
}
