class Thera {
  String? meterNumber;
  String? unitNumber;
  List<PriceList>? priceList;
  List<TransactionHistory>? transactionHistory;

  Thera({this.meterNumber, this.unitNumber, this.priceList, this.transactionHistory});

  Thera.fromJson(Map<String, dynamic> json) {
    meterNumber = json['meter_number'];
    unitNumber = json['unit_number'];
    if (json['price_list'] != null) {
      priceList = <PriceList>[];
      json['price_list'].forEach((v) {
        priceList!.add(PriceList.fromJson(v));
      });
    }
    if (json['transaction_history'] != null) {
      transactionHistory = <TransactionHistory>[];
      json['transaction_history'].forEach((v) {
        transactionHistory!.add(TransactionHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meter_number'] = meterNumber;
    data['unit_number'] = unitNumber;
    if (priceList != null) {
      data['price_list'] = priceList!.map((v) => v.toJson()).toList();
    }
    if (transactionHistory != null) {
      data['transaction_history'] = transactionHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PriceList {
  int? id;
  int? amount;
  double? kwh;

  PriceList({this.id, this.amount, this.kwh});

  PriceList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    kwh = json['kwh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['kwh'] = kwh;
    return data;
  }
}

class TransactionHistory {
  String? trxCode;
  int? amount;
  int? paymentFee;
  double? kwh;
  String? paymentDate;

  TransactionHistory({this.trxCode, this.amount, this.paymentFee, this.kwh, this.paymentDate});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
    trxCode = json['trx_code'];
    amount = json['amount'];
    paymentFee = json['payment_fee'];
    kwh = json['kwh'];
    paymentDate = json['payment_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['trx_code'] = trxCode;
    data['amount'] = amount;
    data['payment_fee'] = paymentFee;
    data['kwh'] = kwh;
    data['payment_date'] = paymentDate;
    return data;
  }
}

class TheraDetail {
  String? meterNumber;
  String? unitNumber;
  String? trxCode;
  int? amount;
  int? paymentFee;
  double? kwh;
  String? paymentDate;
  String? tokenCode;
  String? paymentBank;
  String? paymentMethod;

  TheraDetail({
    this.meterNumber,
    this.unitNumber,
    this.trxCode,
    this.amount,
    this.paymentFee,
    this.kwh,
    this.paymentDate,
    this.tokenCode,
    this.paymentBank,
    this.paymentMethod,
  });

  int get totalAmount => (amount! + paymentFee!);

  TheraDetail.fromJson(Map<String, dynamic> json) {
    meterNumber = json['meter_number'];
    unitNumber = json['unit_number'];
    trxCode = json['trx_code'];
    amount = json['amount'];
    paymentFee = json['payment_fee'];
    kwh = json['kwh'];
    paymentDate = json['payment_date'];
    tokenCode = json['token_code'];
    paymentBank = json['payment_bank'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meter_number'] = meterNumber;
    data['unit_number'] = unitNumber;
    data['trx_code'] = trxCode;
    data['amount'] = amount;
    data['payment_fee'] = paymentFee;
    data['kwh'] = kwh;
    data['payment_date'] = paymentDate;
    data['token_code'] = tokenCode;
    data['payment_method'] = paymentMethod;
    data['payment_bank'] = paymentBank;
    return data;
  }
}

class SelectedPriceList {
  int index;
  String? meterNumber;
  String? unitId;
  int? amount;

  SelectedPriceList({this.index = 0, this.meterNumber, this.unitId, this.amount});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['meter_number'] = meterNumber;
    data['unitId'] = unitId;
    data['amount'] = amount;

    return data;
  }
}

// var theraDummyData = Thera(
//   meterNumber: "1234567890",
//   unitNumber: "Unit-123",
//   priceList: [
//     PriceList(id: 1, amount: 100000, kwh: 66.56),
//     PriceList(id: 2, amount: 150000, kwh: 99.83),
//     PriceList(id: 3, amount: 200000, kwh: 133.11),
//     PriceList(id: 4, amount: 250000, kwh: 166.39),
//     PriceList(id: 5, amount: 300000, kwh: 199.67),
//   ],
//   transactionHistory: [
//     TransactionHistory(trxCode: 'TRX001', amount: 10000, paymentFee: 5000, kwh: 10.0, paymentDate: '2024-01-30 23:00'),
//     TransactionHistory(trxCode: 'TRX002', amount: 15000, paymentFee: 5000, kwh: 15.0, paymentDate: '2023-12-02 23:00'),
//     TransactionHistory(trxCode: 'TRX003', amount: 20000, paymentFee: 5000, kwh: 20.0, paymentDate: '2023-11-29 19:00'),
//   ]
// );