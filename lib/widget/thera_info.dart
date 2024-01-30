import 'package:flutter/material.dart';

class TheraInfo extends StatelessWidget {
  const TheraInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      color: Colors.orange[50],
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info_outline, color: Colors.orange, size: 18),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1. ",
                      style: TextStyle(fontSize: 13),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
                          children: [
                            TextSpan(children: [
                              TextSpan(text: "Proses verifikasi transaksi "),
                              TextSpan(text: "maksimal 1 x 24 jam.", style: TextStyle(fontWeight: FontWeight.bold)),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2. ",
                      style: TextStyle(fontSize: 13),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
                          children: [
                            TextSpan(children: [
                              TextSpan(text: "Mohon "),
                              TextSpan(text: "cek limit kWh ", style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: "anda sebelum membeli token listrik."),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}