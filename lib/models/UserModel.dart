class User{

  int UserID;
  String username;
  String firstName;
  String lastName;
  String password;
  String Email;

  User({

    this.UserID=0,
    this.username="",
    this.firstName="",
    this.lastName="",
    this.password="",
    this.Email="",

  });


  factory User.fromJson(Map<String,dynamic>  json)=>User(
    username: json ["username"],
    firstName: json ["firstName"],
    lastName: json ["lastName"],
    password: json ["password"],
    UserID: json ["UserID"],
    Email: json ["Email"],


  );
  Map<String,dynamic> toJson() => {
    "username": username,
    "firstName" :firstName,
    "lastName" :lastName,
    "password" :password,
    "UserID":UserID,
    "email":Email,

  };
}