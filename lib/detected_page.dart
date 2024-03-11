// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class DetectedImagePage extends StatefulWidget {
//   @override
//   _DetectedImagePageState createState() => _DetectedImagePageState();
// }
//
// class _DetectedImagePageState extends State<DetectedImagePage> {
//   String imageUrl = '';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchImageUrl();
//   }
//
//   Future<void> fetchImageUrl() async {
//     final response =
//     await http.get(Uri.parse('http://192.168.1.4:5000/detected/output.jpg'));
//
//     if (response.statusCode == 200) {
//       setState(() {
//         imageUrl = 'http://192.168.1.4:5000/detected/output.jpg';
//       });
//
//     } else {
//       // Handle error
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detected Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             imageUrl.isNotEmpty
//                 ? SizedBox(
//               width: 600, // Adjust the width as per your requirement
//               height: 600, // Adjust the height as per your requirement
//               child: Image.network(imageUrl),
//             )
//                 : CircularProgressIndicator(),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle Next button action
//               },
//               child: Text('Next'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetectedImagePage extends StatefulWidget {
  @override
  _DetectedImagePageState createState() => _DetectedImagePageState();
}

class _DetectedImagePageState extends State<DetectedImagePage> {
  String imageUrl = '';
  String resultsText = ''; // Variable to hold the results text

  @override
  void initState() {
    super.initState();
    fetchImageUrl();
    fetchResults(); // Fetch the results when the page is initialized
  }

  Future<void> fetchImageUrl() async {
    final response = await http.get(Uri.parse('http://192.168.1.4:5000/detected/output.jpg'));

    if (response.statusCode == 200) {
      setState(() {
        imageUrl = 'http://192.168.1.4:5000/detected/output.jpg';
      });
    } else {
      // Handle error
    }
  }

  Future<void> fetchResults() async {
    final response = await http.get(Uri.parse('http://192.168.1.4:5000/results'));

    if (response.statusCode == 200) {
      setState(() {
        resultsText = response.body; // Set the results text
      });
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detected Image'),
      ),
      body: SingleChildScrollView( // Wrap Column with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageUrl.isNotEmpty
                  ? SizedBox(
                width: 600, // Adjust the width as per your requirement
                height: 600, // Adjust the height as per your requirement
                child: Image.network(imageUrl),
              )
                  : CircularProgressIndicator(),
              SizedBox(height: 20),
              if (resultsText.isNotEmpty) // Display the results if available
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(resultsText),
                ),
              SizedBox(height: 0),
              ElevatedButton(
                onPressed: () {
                  // Handle Next button action
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


