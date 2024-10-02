import 'package:stacked/stacked.dart';

class GameScreenViewModel extends BaseViewModel {
  List<String> board = List.filled(9, '');

  String currentPlayer = 'X';
  String playerX = '';
  String playerO = '';
  GameScreenViewModel(this.playerX, this.playerO);

  String resultMessage = "Player X's turn";

  bool gameFinished = false;

  void handleTap(int index) {
    if (board[index] == '' && !gameFinished) {
      board[index] = currentPlayer;
      notifyListeners();

      if (checkWinner()) {
        resultMessage = 'Player $currentPlayer wins!';
        gameFinished = true;
      } else if (board.every((cell) => cell != '')) {
        resultMessage = "It's a tie!";
        gameFinished = true;
      } else {
        currentPlayer = currentPlayer == playerX ? playerO : playerX;
        resultMessage = "Player $currentPlayer's turn";
      }

      notifyListeners();
    }
  }

  bool checkWinner() {
    const winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] == currentPlayer &&
          board[combo[1]] == currentPlayer &&
          board[combo[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    board = List.filled(9, '');
    currentPlayer = 'X';
    resultMessage = "Player X's turn";
    gameFinished = false;
    notifyListeners();
  }
}
