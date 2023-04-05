import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';

class SelfieVerificationScreen extends StatefulWidget {
  @override
  _SelfieVerificationScreenState createState() =>
      _SelfieVerificationScreenState();
}

class _SelfieVerificationScreenState extends State<SelfieVerificationScreen> {
  bool? verificationImagee = null;

  File? _image;
  final picker = ImagePicker();

  List<Pose> faces = [];

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> performVerification() async {
    final image = InputImage.fromFile(_image!);
    final faceDetector = GoogleMlKit.vision;
    faces = await faceDetector.poseDetector().processImage(image);
    if (faces.isEmpty) {
      // No face detected

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('No face detected.'),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                verificationImagee = false;
                setState(() {});
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
      return;
    }
    final face = faces[0];
    final verificationImage = InputImage.fromFile(_image!);

    // Show success message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('Face verified.'),
        actions: [
          ElevatedButton(
            child: Text('OK'),
            onPressed: () {
              verificationImagee = true;
              setState(() {});
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selfie Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            verificationImagee == null
                ? Container()
                : verificationImagee == true
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.lightGreen, shape: BoxShape.circle))
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle)),
            _image == null
                ? Text('No image selected.')
                : Image.file(
                    _image!,
                    width: 300,
                    height: 300,
                  ),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Take a Selfie'),
            ),
            SizedBox(height: 20),
            _image == null
                ? Container()
                : ElevatedButton(
                    onPressed: performVerification,
                    child: Text('Verify Selfie'),
                  ),
          ],
        ),
      ),
    );
  }
}
