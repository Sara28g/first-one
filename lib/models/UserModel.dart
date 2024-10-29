class User{

  String username;
  String name;
  String phone;
  String note;
  String email;

  User({
    this.username="",
    this.name="",
    this.phone="",
    this.note="",
    this.email="",

  });


  factory User.fromJson(Map<String,dynamic>  json)=>User(
    username: json ["username"],
    name: json ["name"],
    phone: json ["phone"],
    note: json ["note"],
    email: json ["email"],


  );
  Map<String,dynamic> toJson() => {
    "username": username,
    "name" :name,
    "phone" :phone,
    "note":note,
    "email":email,

  };
}