import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:translator/translator.dart';

import '../widgets/image_input.dart';
import 'checkup_button.dart';

class TextScanner extends StatefulWidget {
  const TextScanner({Key? key}) : super(key: key);

  @override
  State<TextScanner> createState() => _TextScannerState();
}

class _TextScannerState extends State<TextScanner> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  bool textScanning = false;
  String scannedText = "";
  bool isImageSelected = false;
  final translator = GoogleTranslator();
  String translatedText = "";

  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void getRecognisedText(File image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    final recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    _titleController.text = scannedText;
    textScanning = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          ImageInput(
            onPickImage: (image) {
              _selectedImage = image;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CheckupButton(
                  route: () => getRecognisedText(_selectedImage!),
                  text: 'Scan',
                ),
                const SizedBox(
                  width: 7.5,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            color: Color(0xB7B597),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _titleController,
                maxLines: null,
                decoration: const InputDecoration(
                  filled: false,
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide(width: 1.0)),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide(width: 1.0)),
                  hintText: 'param1',
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          CheckupButton(
            route: () {
              setState(() {
                translator
                    .translate(_titleController.text, to: 'en')
                    .then((data) => translatedText = data.toString());
              });
            },
            text: 'Translate',
          ),
          Card(
            color: Color(0xB7B597),
            child: Container(
              width: double.infinity,  
              padding: EdgeInsets.all(10),
              child: Text(translatedText),
            ),
          ),
          const SizedBox(height: 80)
        ],
      ),
    );
  }
}
