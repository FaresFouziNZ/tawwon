class Organization {
  String? time;
  List<String>? types;
  String? name;
  String? description;
  String? uid;
  String? logoUrl;

  Organization({
    this.time,
    this.types,
    this.name,
    this.description,
    this.uid,
    this.logoUrl,
  });

  factory Organization.fromMap(Map<String, dynamic> json) => Organization(
        time: json['time'],
        types: json['types'].cast<String>(),
        name: json['name'],
        description: json['description'],
        uid: json['uid'],
        logoUrl: json['logoUrl'],
      );

  Map<String, dynamic> toMap() => {
        'time': time,
        'types': types,
        'name': name,
        'description': description,
        'uid': uid,
        'logoUrl': logoUrl,
      };
}
