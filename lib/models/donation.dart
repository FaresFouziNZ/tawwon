class Donation {
  String? category;
  String? donorID;
  String? imageUrl;
  String? name;
  String? phoneNumber;
  String? description;
  String? location;
  bool? isConcluded;

  Donation({
    this.category,
    this.donorID,
    this.imageUrl,
    this.name,
    this.phoneNumber,
    this.description,
    this.location,
    this.isConcluded,
  });

  factory Donation.fromMap(Map<String, dynamic> json) => Donation(
        category: json['category'],
        donorID: json['donorID'],
        imageUrl: json['imageUrl'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        description: json['description'],
        location: json['location'],
        isConcluded: json['isConcluded'],
      );

  Map<String, dynamic> toMap() => {
        'category': category,
        'donorID': donorID,
        'imageUrl': imageUrl,
        'name': name,
        'phoneNumber': phoneNumber,
        'description': description,
        'location': location,
        'isConcluded': isConcluded,
      };
}
