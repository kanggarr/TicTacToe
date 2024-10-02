import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tic_tac_toe/ui/views/game_screen/game_screen_view.dart';
import 'package:tic_tac_toe/ui/widgets/player_input.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Players'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlayerInput(
                label: 'Player X',
                controller: viewModel.player1Controller,
                currentColor: viewModel.player1Color,
                onColorChanged: (color) => viewModel.setPlayer1Color(color),
              ),
              const SizedBox(height: 20),
              PlayerInput(
                label: 'Player O',
                controller: viewModel.player2Controller,
                currentColor: viewModel.player2Color,
                onColorChanged: (color) => viewModel.setPlayer2Color(color),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (viewModel.isInputValid()) {
                      viewModel.navigatePage();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Please fill out both players\' names and choose colors.')),
                      );
                    }
                  },
                  child: const Text('Start Game'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
