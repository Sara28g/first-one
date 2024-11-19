class User{

  int UserID;
  String username;
  String Firstname;
  String Lastname;
  String phone;
  String email;

  User({

    this.UserID=0,
    this.username="",
    this.Firstname="",
    this.Lastname="",
    this.phone="",
    this.email="",

  });


  factory User.fromJson(Map<String,dynamic>  json)=>User(
    username: json ["username"],
    Firstname: json ["Firstname"],
    Lastname: json ["Lastname"],
    phone: json ["phone"],
    UserID: json ["UserID"],
    email: json ["email"],


  );
  Map<String,dynamic> toJson() => {
    "username": username,
    "Firstname" :Firstname,
    "Lastname" :Lastname,
    "phone" :phone,
    "UserID":UserID,
    "email":email,

  };
}