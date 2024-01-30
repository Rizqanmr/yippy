import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../model/thera_model.dart';
import '../repository/thera_repository.dart';

class TheraVm with ChangeNotifier {
  bool _isLoading = true;
  Thera? _thera;
  TheraDetail? _theraDetail;
  final TheraRepository _repository = TheraRepository();
  SelectedPriceList? selectedPriceList;

  bool get isLoading => _isLoading;
  Thera? get thera => _thera;
  TheraDetail? get detail => _theraDetail;

  Future<void> getData({int unitId = 1}) async {
    try {
      // Set isLoading to true while fetching data
      _isLoading = true;
      notifyListeners();

      // Call the repository to fetch data
      final response = await _repository.getData(unitId: unitId);

      // Set the fetched data to _thera
      _thera = response;

      // Set isLoading to false after fetching data
      _isLoading = false;

      // Notify listeners about the change in data
      notifyListeners();
    } catch (e) {
      // Handle errors
      print('Error: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDetail(String trxCode) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await _repository.getDetail(trxCode: trxCode);
      _theraDetail = response;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      // Handle errors
      print('Error: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectPriceList(int index) {
    selectedPriceList = SelectedPriceList(
      index: index,
      meterNumber: thera?.meterNumber,
      unitId: thera?.unitNumber,
      amount: thera?.priceList?[index].amount,
    );

    notifyListeners();
  }
}