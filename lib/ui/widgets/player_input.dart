import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PlayerInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Color currentColor;
  final Function(Color) onColorChanged;

  const PlayerInput({
    super.key,
    required this.label,
    required this.controller,
    required this.currentColor,
    required this.onColorChanged,
  });

  @override
  State<PlayerInput> createState() => _PlayerInputState();
}

class _PlayerInputState extends State<PlayerInput> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.currentColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: const TextStyle(fontSize: 20)),
        TextField(
          controller: widget.controller,
          decoration: const InputDecoration(hintText: 'Enter name'),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text('Choose Color:'),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Select Color'),
                    content: BlockPicker(
                      pickerColor: _selectedColor,
                      onColorChanged: (color) {
                        setState(() {
                          _selectedColor = color;
                        });
                        widget.onColorChanged(color);
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                color: _selectedColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
