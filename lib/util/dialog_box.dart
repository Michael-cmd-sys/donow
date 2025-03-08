import "package:donow/util/custom_button.dart";
import "package:flutter/material.dart";

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback handleSave;
  VoidCallback handleCancel;

  DialogBox({
      super.key, 
      required this.controller,
      required this.handleSave,
      required this.handleCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[300],
        content: Container(
            height: 120,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Add a new todo task...",
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomButton(
                          name: "Save",
                          onPressed: handleSave,
                        ),
                        const SizedBox(width: 8.0),
                        CustomButton(
                          name: "Cancel",
                          onPressed: handleCancel,
                        ),
                      ])
                ])));
  }
}
