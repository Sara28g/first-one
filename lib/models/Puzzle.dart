class Move{

  int UserID;
  int PuzzleID;
  String puzzelContext;
  String puzzelAnswer;
  bool complete;



  Move({
    this. UserID=0,
    this. PuzzleID=0,
    this. puzzelContext="",
    this. puzzelAnswer="",
    this. complete=false,

  });


  factory  Move.fromJson(Map<String,dynamic>  json)=>Move(
    UserID: json ["UserID"],
    PuzzleID: json ["PuzzleID"],
    puzzelContext: json ["puzzelContext"],
    puzzelAnswer: json ["puzzelAnswer"],
    complete: json ["complete"],


  );
  Map<String,dynamic> toJson() => {
    "UserID": UserID,
    "PuzzleID" :PuzzleID,
    "puzzelContext" :puzzelContext,
    "puzzelAnswer":puzzelAnswer,
    "complete":complete,

  };
}