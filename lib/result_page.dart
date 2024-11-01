import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final double height;

  ResultPage({required this.bmi, required this.height});

  String getBMIClassification(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 24.9) return 'Normal weight';
    if (bmi < 29.9) return 'Overweight';
    return 'Obese';
  }

  String getNormalWeightRange(double height) {
    final minNormalWeight = 18.5 * (height * height);
    final maxNormalWeight = 24.9 * (height * height);
    return '${minNormalWeight.toStringAsFixed(1)} kg - ${maxNormalWeight.toStringAsFixed(1)} kg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.lightBlue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your BMI is ${bmi.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Text(
                  getBMIClassification(bmi),
                  style: TextStyle(fontSize: 22, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Normal weight range for your height: ${getNormalWeightRange(height)}',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
