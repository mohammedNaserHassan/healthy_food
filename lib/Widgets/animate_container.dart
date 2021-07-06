import 'package:flutter/material.dart';

class animate_container extends StatefulWidget {
  String cardTitle, info, unit;

  animate_container(this.cardTitle, this.info, this.unit);

  @override
  _animate_containerState createState() => _animate_containerState();
}

class _animate_containerState extends State<animate_container> {
  var select = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            select = widget.cardTitle;
          });
        },
        child: Row(
          children: [
            AnimatedContainer(
                duration: Duration(seconds: 10),
                curve: Curves.ease,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: widget.cardTitle == select
                      ? Color(0xFF7A9BEE)
                      : Colors.white,
                  border: Border.all(
                      color: widget.cardTitle == select
                          ? Colors.transparent
                          : Colors.grey.withOpacity(0.3),
                      width: 0.1),
                ),
                height: 200.0,
                width: 100.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                        child: Text(widget.cardTitle,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: widget.cardTitle == select
                                  ? Colors.white
                                  : Colors.grey.withOpacity(0.7),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.info,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: widget.cardTitle == select
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text(widget.unit,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: widget.cardTitle == select
                                      ? Colors.white
                                      : Colors.black,
                                ))
                          ],
                        ),
                      )
                    ])),
            SizedBox(width: 10.0),
          ],
        ));
  }
}
