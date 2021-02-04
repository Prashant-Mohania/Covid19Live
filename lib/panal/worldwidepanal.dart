import 'package:flutter/material.dart';

class WorldWidePanal extends StatelessWidget {
  final Map worldData;

  const WorldWidePanal(this.worldData);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: [
          StatusPanal(
            panalColor: Colors.red[400],
            textColor: Colors.red[900],
            title: "CONFIRMED",
            count: worldData['cases'].toString(),
          ),
          StatusPanal(
            panalColor: Colors.green[400],
            textColor: Colors.green[900],
            title: "ACTIVE",
            count: worldData['active'].toString(),
          ),
          StatusPanal(
            panalColor: Colors.blue[400],
            textColor: Colors.blue[900],
            title: "RECOVERED",
            count: worldData['recovered'].toString(),
          ),
          StatusPanal(
            panalColor: Colors.grey[400],
            textColor: Colors.grey[900],
            title: "DEATHS",
            count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}

class StatusPanal extends StatelessWidget {
  final Color panalColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanal(
      {Key key, this.panalColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, 1),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}
