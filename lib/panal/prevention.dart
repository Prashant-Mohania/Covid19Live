import 'package:flutter/material.dart';

class Prevention extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            _buildPrevention("assets/images/a10.png", "WASH", "hands often"),
            _buildPrevention("assets/images/a4.png", "COVER", "your cough"),
            _buildPrevention("assets/images/a6.png", "ALWAYS", "clean"),
            _buildPrevention("assets/images/a9.png", "USE", "mask"),
          ],
        ),
      ),
    );
  }
}

Widget _buildPrevention(String path, String text1, String text2) {
  return Column(
    children: <Widget>[
      Container(
        width: 170,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            Image.asset(path),
            SizedBox(width: 10),
            RichText(
              text: TextSpan(
                  text: "$text1\n",
                  style: TextStyle(
                    color: Color(0XFF8d12fe),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: text2,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ]),
            )
          ],
        ),
        margin: EdgeInsets.only(right: 20),
      ),
      SizedBox(height: 7),
    ],
  );
}
