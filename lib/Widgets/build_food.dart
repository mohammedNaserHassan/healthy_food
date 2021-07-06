import 'package:flutter/material.dart';
import 'package:healthy_food/Screens/second_screen.dart';

class build_food extends StatefulWidget {
  String img, foodname, price;
  int index;

  build_food(this.img, this.foodname, this.price, this.index);

  @override
  _build_foodState createState() => _build_foodState();
}

class _build_foodState extends State<build_food> {
  List state = [false, false, false, false];
  var sum = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (c) => Second_Screen(
                    foodName: widget.foodname,
                    heroTag: widget.img,
                    foodPrice: widget.price,
                  )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Image(
                    image: AssetImage(widget.img),
                    fit: BoxFit.cover,
                    height: 75,
                    width: 75,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.foodname,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.price,
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  state[index] = !state[index];
                  setState(() {});
                },
                icon: !state[index]
                    ? Icon(
                        Icons.add,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.check,
                        color: Colors.green,
                      ))
          ],
        ),
      ),
    );
  }
}
