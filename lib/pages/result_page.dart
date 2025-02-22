import 'dart:io';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final File imageFile;

  const ResultPage({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    // Mock Data - Replace with API/backend response
    Map<String, dynamic> faceAnalysis = {
      "Acne": {"level": "Mild", "icon": Icons.warning_amber, "color": Colors.orange},
      "Blackheads": {"level": "None", "icon": Icons.check_circle, "color": Colors.green},
      "Dark Spots": {"level": "Moderate", "icon": Icons.blur_on, "color": Colors.blue},
      "Dry Skin": {"level": "Low", "icon": Icons.opacity, "color": Colors.lightBlue},
      "Eye Bags": {"level": "Severe", "icon": Icons.remove_red_eye, "color": Colors.red},
      "Normal Skin": {"level": "Yes", "icon": Icons.tag_faces, "color": Colors.green},
      "Oily Skin": {"level": "No", "icon": Icons.block, "color": Colors.grey},
      "Pores": {"level": "Medium", "icon": Icons.grain, "color": Colors.purple},
      "Skin Redness": {"level": "Mild", "icon": Icons.color_lens, "color": Colors.orange},
      "Wrinkles": {"level": "High", "icon": Icons.face, "color": Colors.redAccent},
    };

    return WillPopScope(
      onWillPop: () async {
        return await _showExitDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Face Analysis Result"),
          backgroundColor: Colors.deepPurpleAccent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _showExitDialog(context)) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A2980), Color(0xFF26D0CE)], // Blue gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              // Image Display
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.file(
                  imageFile,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // Title
              const Text(
                "Analysis Results",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),

              const SizedBox(height: 10),

              // Results List
              Expanded(
                child: ListView.builder(
                  itemCount: faceAnalysis.length,
                  itemBuilder: (context, index) {
                    String key = faceAnalysis.keys.elementAt(index);
                    var value = faceAnalysis[key];

                    return Card(
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(value["icon"], color: value["color"]),
                        title: Text(
                          key,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          value["level"],
                          style: TextStyle(
                            color: value["color"],
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Go Back Button
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text(
                  "Back to Upload",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Exit Confirmation Dialog
  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit Analysis?"),
        content: const Text("Are you sure you want to go back?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Exit"),
          ),
        ],
      ),
    ) ?? false;
  }
}
