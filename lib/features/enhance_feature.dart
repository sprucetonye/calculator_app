// ignore_for_file: deprecated_member_use

import 'package:calculator/business_logic/calulator_logic.dart';
import 'package:calculator/services/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Enhanced calculator with keyboard support and themes
class EnhancedCalculator extends StatefulWidget {
  const EnhancedCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EnhancedCalculatorState createState() => _EnhancedCalculatorState();
}

class _EnhancedCalculatorState extends State<EnhancedCalculator> {
  CalculatorState _state = const CalculatorState();
 // ignore: unused_field
 final _showHistory = false;
  late FocusNode _focusNode;
  
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Focus(
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        autofocus: true,
        child: GestureDetector(
          onTap: () => _focusNode.requestFocus(),
          child: _buildCalculatorUI(),
        ),
      ),
    );
  }
  
  KeyEventResult _handleKeyEvent(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      final key = event.logicalKey;
      
      // Number keys
      if (key.keyId >= LogicalKeyboardKey.digit0.keyId && 
          key.keyId <= LogicalKeyboardKey.digit9.keyId) {
        final digit = (key.keyId - LogicalKeyboardKey.digit0.keyId).toString();
        _handleButtonPress(digit);
        return KeyEventResult.handled;
      }
      
      // Operation keys
      switch (key.keyLabel) {
        case "+":
          _handleButtonPress("+");
          return KeyEventResult.handled;
        case "-":
          _handleButtonPress("-");
          return KeyEventResult.handled;
        case "*":
          _handleButtonPress("×");
          return KeyEventResult.handled;
        case "/":
          _handleButtonPress("÷");
          return KeyEventResult.handled;
        case "=":
        case "Enter":
          _handleButtonPress("=");
          return KeyEventResult.handled;
        case ".":
          _handleButtonPress(".");
          return KeyEventResult.handled;
        case "Escape":
          _handleButtonPress("C");
          return KeyEventResult.handled;
        case "Backspace":
          _handleButtonPress("CE");
          return KeyEventResult.handled;
      }
    }
    
    return KeyEventResult.ignored;
  }
  
  void _handleButtonPress(String value) {
    HapticFeedback.lightImpact();
    setState(() {
      _state = CalculatorLogic.processInput(_state, value);
    });
  }
  
  Widget _buildCalculatorUI() {
    // Implementation similar to previous calculator
    // but with enhanced styling and animations
    return Container(); // Placeholder
  }
  
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
