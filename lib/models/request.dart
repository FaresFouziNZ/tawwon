class Request {
  String? donorID;
  String? organizationID;
  String? type;
  Map<dynamic, dynamic>? items;
  bool? isAccepted;
  String? time;

  Request({
    this.donorID,
    this.organizationID,
    this.type,
    this.items,
    this.isAccepted,
    this.time,
  });

  factory Request.fromMap(Map<String, dynamic> json) => Request(
        donorID: json['donorID'],
        organizationID: json['organizationID'],
        type: json['type'],
        items: json['items'],
        isAccepted: json['isAccepted'],
        time: json['time'],
      );

  Map<String, dynamic> toMap() => {
        'donorID': donorID,
        'organizationID': organizationID,
        'type': type,
        'items': items,
        'isAccepted': isAccepted,
        'time': time,
      };
}
