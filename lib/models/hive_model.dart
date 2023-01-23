class HiveModel {
  String? hiveNumber;
  String? location;
  String? createdAt;
  String? driveLink;
  String? userID;
  String? userName;
  String? amountHoney;
  List<Map<String, dynamic>> history;

  HiveModel({
    this.hiveNumber,
    this.location,
    this.createdAt,
    this.driveLink,
    this.userID,
    this.amountHoney,
    this.userName,
    this.history = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hiveNumber': hiveNumber,
      'location': location,
      'createdAt': createdAt,
      'driveLink': driveLink,
      'userID': userID,
      'amountHoney': amountHoney,
      'userName': userName,
      'history': history,
    };
  }

  factory HiveModel.fromMap(Map<String, dynamic> map) {
    return HiveModel(
      hiveNumber:
          map['hiveNumber'] != null ? map['hiveNumber'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      driveLink: map['driveLink'] != null ? map['driveLink'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      amountHoney:
          map['amountHoney'] != null ? map['amountHoney'] as String : null,
      history: List.from((map['history'] as List).map((e) => e)),
    );
  }
}
