class HoneyModel {
  String? hiveNumber;
  String? createdAt;
  String? amountOfHoney;
  String? userID;

  HoneyModel({
    this.hiveNumber,
    this.createdAt,
    this.amountOfHoney,
    this.userID,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hiveNumber': hiveNumber,
      'createdAt': createdAt,
      'amountOfHoney': amountOfHoney,
      'userID': userID,
    };
  }

  factory HoneyModel.fromMap(Map<String, dynamic> map) {
    return HoneyModel(
      hiveNumber:
          map['hiveNumber'] != null ? map['hiveNumber'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      amountOfHoney:
          map['amountOfHoney'] != null ? map['amountOfHoney'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
    );
  }
}
