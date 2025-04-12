class checkloginModel {
  int? userID;
  String? fullName;


  checkloginModel({
    this.userID,
    this.fullName,

  });


  factory checkloginModel.fromJson(Map<String, dynamic> json) {
    return checkloginModel(
      userID: json['userID'],
      fullName: json['fullName'],


    );
  }
}
