import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> jokes = [];
  String currentJoke = '';
  final random = Random();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadJokes();
  }

  Future<void> loadJokes() async {
    try {
      final firestoreJokes = await FirebaseFirestore.instance.collection('odia_jokes').get();
      jokes = firestoreJokes.docs.map((doc) => doc['text'] as String).toList();
    } catch (_) {
      final data = await rootBundle.loadString('assets/jokes.json');
      jokes = List<String>.from(json.decode(data));
    }

    setState(() {
      currentJoke = jokes[random.nextInt(jokes.length)];
      isLoading = false;
    });
  }

  void showNextJoke() {
    setState(() {
      currentJoke = jokes[random.nextInt(jokes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ଓଡ଼ିଆ ମଜାକଥା')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        currentJoke,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: showNextJoke,
                    child: const Text("😂 ଆଉ ଗୋଟେ କହ | Next"),
                  )
                ],
              ),
            ),
    );
  }
}
