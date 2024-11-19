class Move{

  int UserID;
  int moveID;
  String lastPosition;
  String firstPosition;
  int puzzleSolved;
  String Placement;



  Move({
    this. UserID=0,
    this. moveID=0,
    this. lastPosition="",
    this. firstPosition="",
    this. puzzleSolved=0,
    this. Placement="",

  });


  factory  Move.fromJson(Map<String,dynamic>  json)=>Move(
    UserID: json ["UserID"],
    moveID: json ["moveID"],
    lastPosition: json ["lastPosition"],
    firstPosition: json ["firstPosition"],
    puzzleSolved: json ["puzzleSolved"],
    Placement: json ["Placement"],


  );
  Map<String,dynamic> toJson() => {
    "UserID": UserID,
    "moveID" :moveID,
    "lastPosition" :lastPosition,
    "firstPosition":firstPosition,
    "puzzleSolved":puzzleSolved,
    "Placement":Placement,

  };
}