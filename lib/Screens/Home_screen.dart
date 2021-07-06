import 'package:flutter/material.dart';
import 'package:healthy_food/Widgets/build_food.dart';
import 'package:healthy_food/Widgets/my_drawer.dart';

class home_screen extends StatefulWidget {
  home_screen();

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  List state = [false, false, false, false];
  var sum = 0;
  int index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> l;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xFF21BFBD),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                state[index] = state[index + 1];
                              });
                            },
                            icon: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, top: 25),
              child: Row(
                children: [
                  Text(
                    'Healthy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Text(
                    'Food',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height - 185.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0))),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25, right: 20),
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 350,
                      child: ListView(
                        children: [
                          build_food(
                              'assets/plate1.png', 'Salmon bowl', '\$24.00', 0),
                          build_food(
                              'assets/plate2.png', 'Spring bowl', '\$22.00', 1),
                          build_food('assets/plate3.png', 'Avocado bowl',
                              '\$26.00', 2),
                          build_food(
                              'assets/plate4.png', 'Berry bowl', '\$19.00', 3),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 65,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text('Total price =\$ ${sum}'),
                                      content: Container(
                                        height: 170,
                                        child: Column(
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Enter your name',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Enter your phone',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: Text('Confirm'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: Text('Cancel'),
                                        ),
                                      ],
                                    ));
                          },
                          icon: Icon(
                            Icons.shopping_basket,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Color(0xFF1C1428),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: TextButton(
                          onPressed: () {
                            // ignore: deprecated_member_use
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Will be added into your card'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            ));
                          },
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        endDrawer: my_drawer());
  }
}
