import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Vaccine extends StatefulWidget {
  final String countryName;

  const Vaccine({Key key, this.countryName}) : super(key: key);
  @override
  _VaccineState createState() => _VaccineState();
}

class _VaccineState extends State<Vaccine> {
  Map vaccine;
  fetchVaccineData() async {
    http.Response response = await http.get(
        "https://corona.lmao.ninja/v3/covid-19/vaccine/coverage/countries/${widget.countryName}");
    if (response.statusCode == 200) {
      setState(() {
        vaccine = json.decode(response.body);
      });
    } else if (response.statusCode == 404) {
      setState(() {
        vaccine = {
          "timeline": {"": "Vaccinating is not started yet"}
        };
      });
    }
  }

  @override
  void initState() {
    fetchVaccineData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Vaccinating"),
      ),
      body: vaccine == null
          ? Container(
              color: Colors.grey[300],
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              color: Colors.grey[400],
              child: ListView.builder(
                itemCount: vaccine['timeline'].keys.toList().length,
                itemBuilder: (context, index) {
                  String key = vaccine['timeline'].keys.elementAt(index);
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "$key",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              vaccine['timeline'][key].toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
