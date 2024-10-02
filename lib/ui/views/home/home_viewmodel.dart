import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tic_tac_toe/app/app.locator.dart';
import 'package:tic_tac_toe/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  Color player1Color = Colors.blue;
  Color player2Color = Colors.red;

  void setPlayer1Color(Color color) {
    player1Color = color;
    notifyListeners();
  }

  void setPlayer2Color(Color color) {
    player2Color = color;
    notifyListeners();
  }

  bool isInputValid() {
    return player1Controller.text.isNotEmpty &&
        player2Controller.text.isNotEmpty;
  }

  void navigatePage() {
    navigationService.navigateToGameScreenView(
        playerX: player1Controller.text, playerO: player2Controller.text);
  }
}
