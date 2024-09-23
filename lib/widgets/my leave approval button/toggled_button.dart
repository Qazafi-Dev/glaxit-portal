import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleButtonForMyLeave extends StatefulWidget {
  final List<String> buttonTexts;
  final Function(int)? onButtonPressed;
  final List<Widget> contentWidgets;

  const ToggleButtonForMyLeave({
    Key? key,
    required this.buttonTexts,
    this.onButtonPressed,
    required this.contentWidgets,
  }) : super(key: key);

  @override
  _ToggleButtonForMyLeaveState createState() => _ToggleButtonForMyLeaveState();
}

class _ToggleButtonForMyLeaveState extends State<ToggleButtonForMyLeave> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.buttonTexts.length,
                  (index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: CustomButton(
                  text: widget.buttonTexts[index],
                  onPressed: () => _updateSelectedIndex(index),
                  isSelected: _selectedIndex == index,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),

        widget.contentWidgets[_selectedIndex],
      ],
    );
  }

  void _updateSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (widget.onButtonPressed != null) {
      widget.onButtonPressed!(index);
    }
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.transparent,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(fontSize: 16),
      ),
    );
  }
}