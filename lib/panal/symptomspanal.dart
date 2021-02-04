import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 130,
        // padding: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            _buildSymptomItem("assets/images/1.png", "Fever"),
            _buildSymptomItem("assets/images/2.png", "Dry Cough"),
            _buildSymptomItem("assets/images/3.png", "Headache"),
            _buildSymptomItem("assets/images/4.png", "Breathless"),
          ],
        ),
      ),
    );
  }
}

Widget _buildSymptomItem(String path, String text) {
  return Column(
    children: <Widget>[
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0XFFefedf2),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 3,
            )
          ],
        ),
        padding: EdgeInsets.only(top: 15),
        child: Image.asset(path),
        margin: EdgeInsets.only(right: 20),
      ),
      SizedBox(height: 7),
      Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
