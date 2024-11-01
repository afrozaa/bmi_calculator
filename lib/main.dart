import 'package:flutter/material.dart';
import 'result_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  void _calculateBMI() {
    final weight = double.tryParse(weightController.text);
    final heightCm = double.tryParse(heightController.text);

    if (weight != null && heightCm != null && heightCm > 0) {
      final height = heightCm / 100; 
      final bmi = weight / (height * height);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(bmi: bmi, height: height),
        ),
      );
    } else {

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Invalid input. Please enter valid numbers for weight and height.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: weightController,
                      decoration: InputDecoration(
                        labelText: 'Enter Weight (kg)',
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: heightController,
                      decoration: InputDecoration(
                        labelText: 'Enter Height (cm)', // Updated to cm
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _calculateBMI,
                      child: Text(
                        'Calculate BMI',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        shadowColor: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
