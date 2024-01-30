import 'package:flutter/material.dart';

class TheraNotFound extends StatelessWidget {
  const TheraNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: const [
          SizedBox(height: 100),
          SizedBox(
            width: 90,
            child: Icon(Icons.not_interested_rounded),
          ),
          SizedBox(height: 30),
          Text(
            "Nomor Meter Tidak Tersedia",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            "Untuk informasi lebih lanjut, silahkan hubungi Building Management.",
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}