import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/thera_model.dart';
import '../thera_detail.dart';
import '../utils/Utils.dart';

class TheraHistory extends StatelessWidget {
  final List<TransactionHistory> histories;
  const TheraHistory({super.key, required this.histories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Transaction History", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: Colors.black12),
        Column(
          children: List.generate(histories.length, (i) {
            return ListTile(
              leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.electric_bolt_rounded, color: Colors.amberAccent,)
              ),
              title: Text("Nominal ${Utils.moneyFormatter(histories[i].amount)}"),
              subtitle: Text("${DateFormat("d MMM y, HH:mm").format(DateTime.parse(histories[i].paymentDate!))} WIB"),
              trailing: Text(
                Utils.moneyFormatter(histories[i].amount! + histories[i].paymentFee!),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TheraDetailPage(trxCode: histories[i].trxCode!);
                }));
              },
            );
          }),
        )
      ],
    );
  }
}