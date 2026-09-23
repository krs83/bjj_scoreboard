import 'package:flutter/material.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({
    super.key,
    required this.fieldName,
    required this.color,
    required this.controller,
  });

  final String fieldName;
  final Color color;
  final String hintFieldName = 'фамилия и имя спортсмена';
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: .circular(10),
          border: Border.all(color: color, width: 3),
          color: Colors.white70,
        ),

        child: Column(
          children: [
            Text(
              fieldName,
              textAlign: .center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                style: TextStyle(color: color),
                cursorColor: color,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(6.0),
                  hintText: hintFieldName,
                  prefixIcon: Icon(Icons.person_2_rounded),
                  prefixIconColor: color,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: color),
                  ),
                  fillColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
