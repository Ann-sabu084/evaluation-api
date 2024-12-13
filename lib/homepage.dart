import 'dart:convert';
import 'package:flutter_application_1/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/defnitionpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController dcontroller = TextEditingController();
  String definition = "";  // Variable to hold the definition
  
  // Method to fetch data from API
  void getdata() async {
    var url = "https://api.dictionaryapi.dev/api/v2/entries/en/${dcontroller.text}";

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var result = houseFromJson(response.body);

      setState(() {
        // Extracting the definition from the response and updating the state
        definition = result[0].meanings![0].definitions![0].definition ?? "No definition found";
      });
    } else {
      setState(() {
        definition = "Failed to fetch definition.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary"),
      ),
      body: Column(
        children: [
          TextField(
            controller: dcontroller,
            decoration: InputDecoration(
              hintText: "Enter a word",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              getdata();
            },
            child: Text("Get Definition"),
          ),
          // Displaying the fetched definition
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              definition,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
