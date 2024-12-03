class User{

  int userID;
  String username;
  String firstName;
  String lastName;
  String password;
  String Email;

  User({

    this.userID=0,
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
    userID: json ["userID"],
    Email: json ["Email"],


  );
  Map<String,dynamic> toJson() => {
    "username": username,
    "firstName" :firstName,
    "lastName" :lastName,
    "password" :password,
    "userID":userID,
    "email":Email,

  };
}