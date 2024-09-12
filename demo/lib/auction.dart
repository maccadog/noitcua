// auction.dart
import 'package:flutter/material.dart';
import 'package:noitcua1/Login.dart';
import 'package:noitcua1/main.dart';


class AuctionPage extends StatelessWidget {
  const AuctionPage(Type loginPage, {super.key});

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