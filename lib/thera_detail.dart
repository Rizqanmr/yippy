import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:yippy/provider/thera_vm.dart';
import 'package:yippy/utils/Utils.dart';
import 'package:yippy/widget/thera_404.dart';

class TheraDetailPage extends StatefulWidget {
  final String trxCode;
  const TheraDetailPage({super.key, required this.trxCode});

  @override
  State<TheraDetailPage> createState() => _TheraDetailPageState();
}

class _TheraDetailPageState extends State<TheraDetailPage> {
  @override
  void initState() {
    context.read<TheraVm>().getDetail(widget.trxCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Transaction Detail')),
      body: Consumer<TheraVm>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.detail == null) {
            return const TheraNotFound();
          }
          return ListView(
            children: [
              Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                Utils.moneyFormatter(vm.detail!.totalAmount),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      keyValue("No. Meter", vm.detail!.meterNumber.toString()),
                      const SizedBox(height: 10),
                      keyValue("Unit", vm.detail!.unitNumber.toString()),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
                child: vm.detail!.tokenCode!.isEmpty
                    ? const Text(
                  "Token Sedang Diproses. Silahkan cek riwayat transaksi untuk melihat nomor token.",
                  textAlign: TextAlign.center,
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Token :", style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 5),
                    Text(
                      vm.detail!.tokenCode!,
                      style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 140,
                      height: 30,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blue)),
                          onPressed: () async {
                            await Clipboard.setData(ClipboardData(text: vm.detail!.tokenCode!));
                            GlobalSnackBar.showInfoSnackbar(context, 'Copied to Clipboard');
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Salin Token", style: TextStyle(fontSize: 13)),
                              SizedBox(width: 5),
                              Icon(Icons.copy, size: 16),
                            ],
                          )),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      keyValue("No. Transaksi", vm.detail!.tokenCode!),
                      const Divider(height: 15),
                      keyValue("Waktu", DateFormat("d MMM y, HH:mm").format(DateTime.parse(vm.detail!.paymentDate!))),
                      const Divider(height: 15),
                      keyValue("Jumlah Tagihan", Utils.moneyFormatter(vm.detail!.amount)),
                      const Divider(height: 15),
                      keyValue("Convenience fee", Utils.moneyFormatter(vm.detail!.paymentFee)),
                      const Divider(height: 15),
                      keyValue("Payment Method", vm.detail!.paymentBank!.toUpperCase()),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}