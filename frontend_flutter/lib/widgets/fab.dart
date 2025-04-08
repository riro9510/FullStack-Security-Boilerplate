import 'package:flutter/material.dart';
import 'package:frontend_flutter/data/data.dart';

class CustomFAB extends StatelessWidget {
  final List<ActionsFloatingButton> actions;

  CustomFAB({required this.actions});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showOptionsMenu(context);
      },
      child: Icon(Icons.add),
    );
  }

  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemCount: actions.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: actions[index].icon,
              title: Text(actions[index].label),
              onTap: actions[index].action,
            );
          },
        );
      },
    );
  }
}