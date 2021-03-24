import 'package:flutter/material.dart';

TextFormField buildTextFormField(String labelText , TextEditingController textEditingController) {
    return TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              );
  }