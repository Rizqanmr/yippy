import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../model/thera_model.dart';
import '../repository/thera_repository.dart';

class TheraVm with ChangeNotifier {
  bool _isLoading = true;
  Thera? _thera;
  final TheraRepository _repository = TheraRepository();
  ValueNotifier<int> selectedItems = ValueNotifier<int>(-1);

  bool get isLoading => _isLoading;
  Thera? get thera => _thera;

  Future<void> getData({int unitId = 1}) async {
    try {
      // Set isLoading to true while fetching data
      _isLoading = true;
      notifyListeners();

      // Call the repository to fetch data
      Thera theraData = await _repository.getData(unitId: unitId);

      // Set the fetched data to _thera
      _thera = theraData;

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

  void selectItem(int index) {
    selectedItems.value = index;
  }
}