import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdietingui/model/meal.dart';
import 'package:flutterdietingui/reusable_widgets/meal_card.dart';
import 'package:flutterdietingui/screens/workout_Screen.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';
import 'package:animations/animations.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = Tween(begin: 0.0, end: 0.7).animate(animation);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.35,
            child: Container(
              padding: EdgeInsets.only(
                top: 25,
                left: 32,
                right: 16,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM, y").format(today)}", //https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html see only table
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                      ),
                    ),
                    subtitle: Text(
                      "Hello, David",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 26.0,
                        color: Colors.black,
                      ),
                    ),
                    trailing: ClipOval(
                      child: Image.asset('images/user.jpg'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      CustomPaint(
                        painter: MyCustomPainter(progress: animation.value),
                        child: Container(
                          width: width * 0.2,
                          height: width * 0.1,
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: animation.value.toStringAsFixed(1),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28.0,
                                      color: Color(0xFF200087),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\n",
                                  ),
                                  TextSpan(
                                    text: "kcal left",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Color(0xFF200087),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TweenAnimationBuilder(
                            duration: Duration(seconds: 2),
                            tween: Tween(begin: 0.0, end: 0.3),
                            builder: (context, size, child) =>
                                IngredientProgress(
                              ingredient: "Protein",
                              progress: size,
                              progressColor: Colors.green,
                              leftAmount: 72,
                              width: width * 0.2,
                            ),
                          ),
                          TweenAnimationBuilder(
                            duration: Duration(seconds: 2),
                            tween: Tween(begin: 0.0, end: 0.2),
                            builder: (context, size, child) =>
                                IngredientProgress(
                              ingredient: "Carbs",
                              progress: size,
                              progressColor: Colors.red,
                              leftAmount: 252,
                              width: width * 0.2,
                            ),
                          ),
                          TweenAnimationBuilder(
                            duration: Duration(seconds: 2),
                            tween: Tween(begin: 0.0, end: 0.1),
                            builder: (context, size, child) =>
                                IngredientProgress(
                              ingredient: "Fat",
                              progress: size,
                              progressColor: Colors.yellow,
                              leftAmount: 61,
                              width: width * 0.2,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.36,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8.0,
                      left: 32.0,
                      right: 16.0,
                    ),
                    child: Text(
                      "Meal for Today",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.28,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          for (int i = 0; i < meals.length; i++)
                            MealCard(
                              meal: meals[i],
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType: ContainerTransitionType.fadeThrough,
//                      transitionDuration: Duration(seconds: 5),
                      openBuilder: (context, _) => WorkoutScreen(),
                      closedColor: Colors.grey.shade300,
                      closedBuilder: (context, VoidCallback openContainer) {
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: 10,
                              left: 32,
                              right: 32,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF2000BB),
                                  const Color(0xFF200087),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "YOUR NEXT WORKOUT",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Upper Body",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            'images/chest.png',
                                            color: Colors.white,
                                          ),
                                          padding: EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white30,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        Container(
                                          child: Image.asset(
                                            'images/back.png',
                                            color: Colors.white,
                                          ),
                                          padding: EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white30,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        Container(
                                          child: Image.asset(
                                            'images/biceps.png',
                                            color: Colors.white,
                                          ),
                                          padding: EdgeInsets.all(12.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white30,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double progress;

  MyCustomPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10
      ..color = Color(0xFF200087);

    double relativeProgress = 360 * progress;

    Offset center = Offset(size.width / 2, size.height / 2);
//    canvas.drawCircle(center, size.width / 2, paint);
    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(0),
        math.radians(relativeProgress),
        false,
        paint); //angle goes to bottom side
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class IngredientProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress;
  final Color progressColor;
  final width;

  IngredientProgress(
      {this.ingredient,
      this.leftAmount,
      this.progress,
      this.progressColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 10.0,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                ),
                Container(
                  height: 10.0,
                  width: width * progress,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: progressColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5.0,
            ),
            Text("${leftAmount}g left:"),
          ],
        ),
      ],
    );
  }
}
