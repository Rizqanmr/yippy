import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yippy/provider/thera_vm.dart';
import 'package:yippy/utils/Utils.dart';
import 'package:yippy/widget/thera_history.dart';
import 'package:yippy/widget/thera_info.dart';

class TokenListrikPage extends StatefulWidget {
  const TokenListrikPage({super.key});

  @override
  State<StatefulWidget> createState() => _TokenListrikState();
}

class _TokenListrikState extends State<TokenListrikPage> {

  @override
  void initState() {
    context.read<TheraVm>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Token Listrik')),
      body: Consumer<TheraVm>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator(),);
          }
          if (vm.thera == null) {
            return const Center(child: Text("Something went wrong"),);
          }
          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    keyValue("No. Meter", vm.thera!.meterNumber.toString()),
                    keyValue("Unit", vm.thera!.unitNumber.toString()),
                  ],
                ),
              ),
              const Divider(thickness: 2, color: Colors.black12, indent: 16, endIndent: 16,),
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Pilih Nominal Token"),
                    const SizedBox(height: 15,),
                    GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 2.1
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: vm.thera?.priceList?.length ?? 0,
                      itemBuilder: (context, index) {
                        if (vm.thera?.priceList == null) {
                          return const SizedBox.shrink();
                        }
                        return GestureDetector(
                            onTap: () => vm.selectPriceList(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: vm.selectedPriceList?.index == index ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                                border: Border.all(
                                  color: vm.selectedPriceList?.index == index ? Colors.blue : Colors.grey,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    Utils.moneyFormatter(vm.thera!.priceList![index].amount),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  const SizedBox(height: 2,),
                                  Text(
                                      "${vm.thera!.priceList![index].kwh} KWh",
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500
                                      )
                                  ),
                                ],
                              ),
                            )
                        );
                      },
                    ),
                    const TheraInfo(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 0),
                        onPressed: () {
                          //navigate to payment
                        },
                        child: const Text("Pilih Pembayaran")
                    ),
                    const SizedBox(height: 10,),
                    if (vm.thera?.transactionHistory != null) TheraHistory(histories: vm.thera!.transactionHistory!)
                  ],
                ),
              )
            ],
          );
        },
      )
    );
  }

}