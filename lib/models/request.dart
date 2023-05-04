class Request {
  int? rid;
  String? donorID;
  String? organizationID;
  String? type;
  Map<String,int>? items;
  bool? isAccepted;
  String? time;

  Request({
    this.rid,
    this.donorID,
    this.organizationID,
    this.type,
    this.items,
    this.isAccepted,
    this.time,
  });

  factory Request.fromMap(Map<String, dynamic> json) => Request(
        rid: json['ID'],
        donorID: json['donorID'],
        organizationID: json['organizationID'],
        type: json['type'],
        items: json['items'],
        isAccepted: json['isAccepted'],
        time: json['time'],
      );
      
  Map<String, dynamic> toMap() => {
        'ID': rid,
        'donorID': donorID,
        'organizationID': organizationID,
        'type': type,
        'items': items,
        'isAccepted': isAccepted,
        'time': time,
      };
}
