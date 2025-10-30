import 'package:flutter/material.dart';
import 'call_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController callIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zego Call Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Enter Call ID then Join"),
            const SizedBox(height: 15),
            TextField(
              controller: callIdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Call ID",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (callIdController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CallPage(
                        callID: callIdController.text.trim(),
                        userID: "user_${DateTime.now().millisecondsSinceEpoch}",
                        userName: "Mahesh",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Join Call"),
            ),
          ],
        ),
      ),
    );
  }
}
