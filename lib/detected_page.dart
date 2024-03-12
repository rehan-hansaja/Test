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
    final response = await http.get(Uri.parse('http://192.168.1.2:5000/detected/output.jpg'));

    if (response.statusCode == 200) {
      setState(() {
        imageUrl = 'http://192.168.1.2:5000/detected/output.jpg';
      });
    } else {
      // Handle error
    }
  }

  Future<void> fetchResults() async {
    final response = await http.get(Uri.parse('http://192.168.1.2:5000/results'));

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
      body: SingleChildScrollView(
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
              // Wrap both blue boxes in a Container with a specified width
              Container(
                width: 340, // Specify the width for both boxes
                child: Column(
                  children: [
                    // Display the results text in a blue box
                    Container(
                      width: 340,
                      padding: EdgeInsets.all(16), // Add some padding inside the box
                      decoration: BoxDecoration(
                        color: Colors.blue, // Set the background color to blue
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      child: Text(resultsText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)), // Display the results text
                    ),
                    SizedBox(height: 20), // Add some space between the results and the question
                    // Display the question and buttons
                    Container(
                      padding: EdgeInsets.all(16), // Add some padding inside the box
                      decoration: BoxDecoration(
                        color: Colors.blue, // Set the background color to blue
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center, // Center the content inside the box
                        children: [
                          Text('Do you wish to proceed for insurance claiming?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center), // Explicitly set textAlign to center
                          SizedBox(height: 10), // Add some space between the question and the buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Handle "Yes" button press
                                  // For example, navigate to another page or show a dialog
                                },
                                child: Text('Yes'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120, 40), // Set the minimum size for the button
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle "No" button press
                                  // For example, navigate back or show a dialog
                                },
                                child: Text('No'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(120, 40), // Set the minimum size for the button
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Add some space at the bottom of the page
            ],
          ),
        ),
      ),
    );
  }
}
