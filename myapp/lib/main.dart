import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+++ BMI Calculator +++',
      
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _result = '';

  void _calculateBMI() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      setState(() {
        _result = 'Please enter valid values.';
      });
      return;
    }

    final bmi = weight / (height * height);
    final status = bmi < 18.5
        ? 'Underweight'
        : bmi < 25
            ? 'Normal'
            : bmi < 30
                ? 'Overweight'
                : 'Obese';

    setState(() {
      _result = 'BMI: ${bmi.toStringAsFixed(2)}, Status: $status';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 215, 215),
      appBar: AppBar(title: const Text('BMI Calculator'),
      
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 2, 94, 169),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            TextFormField(
              controller: _heightController,
              
              decoration: const InputDecoration(labelText: 'Height (meters)',icon: Icon(Icons.height_sharp)),
              
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
          
            const SizedBox(height: 16),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(labelText: 'Weight (kilograms)',icon: Icon(Icons.line_weight_sharp)),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            const Icon(Icons.calculate,
            
            color: Color.fromARGB(255, 113, 111, 105),),
            ElevatedButton(
              
              onPressed: _calculateBMI,
              child: const Text('Calculate BMI'),
              
              
            ),
            const SizedBox(height: 16),
            Text(
              _result,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
