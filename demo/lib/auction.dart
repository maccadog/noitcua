// auction.dart
import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make an Auction'),
      ),
      body: const Center(
        child: Text('This is the new page'),
      ),
    );
  }
}