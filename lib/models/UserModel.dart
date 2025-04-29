class User{

  int userID;
  String userName;
  String firstName;
  String lastName;
  String password;
  String Email;

  User({

    this.userID=0,
    this.userName="",
    this.firstName="",
    this.lastName="",
    this.password="",
    this.Email="",

  });


  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json["userName"] ?? "",
    firstName: json["firstName"] ?? "",
    lastName: json["lastName"] ?? "",
    password: json["password"] ?? "",
    userID: json["userID"] ?? 0,
    Email: json["Email"] ?? "",
  );

  Map<String,dynamic> toJson() => {
    "userName": userName,
    "firstName" :firstName,
    "lastName" :lastName,
    "password" :password,
    "userID":userID,
    "email":Email,

  };
}