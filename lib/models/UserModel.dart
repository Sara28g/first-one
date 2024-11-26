class User{

  int UserID;
  String username;
  String Firstname;
  String Lastname;
  int password;
  String email;

  User({

    this.UserID=0,
    this.username="",
    this.Firstname="",
    this.Lastname="",
    this.password=0,
    this.email="",

  });


  factory User.fromJson(Map<String,dynamic>  json)=>User(
    username: json ["username"],
    Firstname: json ["Firstname"],
    Lastname: json ["Lastname"],
    password: json ["password"],
    UserID: json ["UserID"],
    email: json ["email"],


  );
  Map<String,dynamic> toJson() => {
    "username": username,
    "Firstname" :Firstname,
    "Lastname" :Lastname,
    "password" :password,
    "UserID":UserID,
    "email":email,

  };
}