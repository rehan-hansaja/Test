// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'dart:convert';
// // import 'dart:io';
// // import 'package:http/http.dart' as http;
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: MyHomePage(title: 'Image upload to server'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   MyHomePage({Key? key, required this.title}) : super(key:key);
// //
// //   final String title;
// //
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   File? selectedImage;
// //   String message = "";
// //
// //   uploadImage() async {
// //     final request = http.MultipartRequest(
// //         "POST", Uri.parse("https://cab8-124-43-246-34.ngrok-free.app/upload"));
// //     final headers = {"Content-type": "multipart/form-data"};
// //     request.files.add(
// //       http.MultipartFile('image',
// //           selectedImage!.readAsBytes().asStream(),selectedImage!.lengthSync(),
// //           filename: selectedImage!.path.split("/").last));
// //
// //     request.headers.addAll(headers);
// //     final response = await request.send();
// //     http.Response res = await http.Response.fromStream(response);
// //     final resJson = jsonDecode(res.body);
// //     message = resJson['message'];
// //     setState(() {
// //     });
// //   }
// //
// //   Future getImage() async{
// //     // final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
// //     //final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
// //     final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
// //     selectedImage = File(pickedImage!.path);
// //     setState(() {});
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             selectedImage == null
// //                 ? Text("Please pick an image to upload")
// //                 : Image.file(selectedImage!),
// //             TextButton.icon(
// //               style: ButtonStyle(
// //                 backgroundColor: MaterialStateProperty.all(Colors.blue)
// //               ),
// //                 onPressed: uploadImage,
// //                 icon: Icon(Icons.upload_file),
// //                 label: Text("upload", style: TextStyle(color: Colors.white),))
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed:getImage,
// //         child: Icon(Icons.add_a_photo),
// //       ),// This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }
//
import 'package:camera/detected_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Image upload to server'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({required this.title});
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   File? selectedImage;
//   String message = "";
//   String extractedText = "";
//
//   uploadImage() async {
//     final request = http.MultipartRequest(
//         "POST", Uri.parse("https://b09f-112-134-246-69.ngrok-free.app/upload"));
//     final headers = {"Content-type": "multipart/form-data"};
//     request.files.add(
//         http.MultipartFile('image',
//             selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
//             filename: selectedImage!.path.split("/").last));
//
//     request.headers.addAll(headers);
//     final response = await request.send();
//     final resJson = jsonDecode(await response.stream.bytesToString());
//     message = resJson['message'];
//     extractedText = resJson['extracted_text'];
//     setState(() {});
//   }
//
//   Future getImage() async {
//     final pickedImage =
//     await ImagePicker().pickImage(source: ImageSource.camera);
//     selectedImage = File(pickedImage!.path);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             selectedImage == null
//                 ? Text("Please pick an image to upload")
//                 : Flexible(
//               child: Image.file(
//                 selectedImage!,
//                 fit: BoxFit.cover, // Adjust the fit property
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(message),
//             SizedBox(height: 20),
//             Text(extractedText),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: uploadImage,
//               child: Text("Upload Image"),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage,
//         child: Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadPage(),
    );
  }
}

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String _model = 'toyota';
  double _scale = 1.0;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;
    final uri = Uri.parse("http://192.168.1.4:5000/upload");
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', _image!.path))
      ..fields['model'] = _model
      ..fields['scale'] = _scale.toString();
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final data = jsonDecode(responseData);
      // Handle the response data
    } else {
      // Handle error
    }
    // In your uploadImage function, after receiving a successful response
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetectedImagePage()),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Damage Detection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Text('No image selected.') : Image.file(File(_image!.path)),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}


