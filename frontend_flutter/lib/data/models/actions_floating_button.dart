import 'package:flutter/material.dart';

class ActionsFloatingButton {
  final Icon icon;
  final String label;
  final VoidCallback action;

  ActionsFloatingButton({
    required this.icon,
    required this.label,
    required this.action,
  });
}