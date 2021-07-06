import 'package:flutter/material.dart';
import 'package:healthy_food/Screens/Home_screen.dart';
import 'package:healthy_food/Widgets/animate_container.dart';

class Second_Screen extends StatefulWidget {
  var heroTag;
  var foodName;
  var foodPrice;

  Second_Screen({this.heroTag, this.foodName, this.foodPrice});

  @override
  _Second_Screen createState() => _Second_Screen();
}

class _Second_Screen extends State<Second_Screen> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Details',
              style: TextStyle(fontSize: 18.0, color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (value) {
                  if (value == 'first') {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (s) => home_screen()));
                  }
                },
                icon: Icon(Icons.more_horiz),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text("First Screen"),
                        value: 'first',
                      ),
                      PopupMenuItem(
                        child: Text("Second Screen"),
                        value: 'second',
                      )
                    ])
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                            fit: BoxFit.cover)),
                    height: 200.0,
                    width: 200.0)),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.foodPrice,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.grey)),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: Color(0xFF7A9BEE)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (count > 0) count--;
                                  });
                                },
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              Text('${count}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0)),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7A9BEE),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 80.0),
                    Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            animate_container('WEIGHT', '300', 'G'),
                            animate_container('CALORIES', '267', 'CAL'),
                            animate_container('VITAMINS', 'A, B6', 'VIT'),
                            animate_container('AVAIL', 'NO', 'AV')
                          ],
                        )),
                    SizedBox(height: 50.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                            color: Colors.black),
                        height: 60.0,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 40),
                                child: Text(
                                  '>>',
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.6),
                                      fontSize: 20),
                                )),
                            Text('>>>>',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 20)),
                            SizedBox(
                              width: 60,
                            ),
                            TextButton(
                              onPressed: () {
                                //
                              },
                              child: Text('\$ 52.00',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))
          ])
        ]));
  }
}
