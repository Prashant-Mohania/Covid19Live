import 'package:covid19live/datasource.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: DataSource.questionAnswers.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                backgroundColor: Colors.grey[300],
                title: Text(
                  DataSource.questionAnswers[index]['question'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(DataSource.questionAnswers[index]['answer']),
                  )
                ],
              );
            }),
      ),
    );
  }
}
