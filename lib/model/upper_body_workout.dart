class UpperBodyWorkout {
  final String imagePath, name, instruction;

  UpperBodyWorkout({this.imagePath, this.name, this.instruction});
}

//2d list
final upperBody = [
  [
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Bench press",
      instruction: "3 sets - 6 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Dumbell press",
      instruction: "4 sets - 6 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Dips",
      instruction: "2 sets - 10 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Pull ups",
      instruction: "2 sets - 8 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Deadlift",
      instruction: "2 sets - 4 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/back.png",
      name: "Lat pulldown",
      instruction: "4 sets - 6 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Bench press",
      instruction: "3 sets - 6 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Dumbell press",
      instruction: "4 sets - 6 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/chest.png",
      name: "Dips",
      instruction: "2 sets - 10 repitions",
    ),
  ],
  [
    UpperBodyWorkout(
      imagePath: "images/biceps.png",
      name: "Pull ups",
      instruction: "2 sets - 8 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/biceps.png",
      name: "Deadlift",
      instruction: "2 sets - 4 repitions",
    ),
    UpperBodyWorkout(
      imagePath: "images/biceps.png",
      name: "Lat pulldown",
      instruction: "4 sets - 6 repitions",
    ),
  ],
];
