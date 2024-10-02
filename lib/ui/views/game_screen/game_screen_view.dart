import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'game_screen_viewmodel.dart';

class GameScreenView extends StackedView<GameScreenViewModel> {
  final String playerX;
  final String playerO;
  const GameScreenView({Key? key, required this.playerX, required this.playerO})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GameScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => viewModel.handleTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          viewModel.board[index],
                          style: TextStyle(
                            fontSize: 40,
                            color: playerX == viewModel.playerX
                                ? Colors.blue
                                : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                viewModel.resultMessage,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: viewModel.resetGame,
              child: const Text('Restart Game'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  GameScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameScreenViewModel(playerX, playerO);
}
