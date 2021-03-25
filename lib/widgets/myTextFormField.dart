import 'package:flutter/material.dart';
import 'package:yumurtatakip2/constants/radius_constants.dart';

TextFormField buildTextFormField(String labelText , TextEditingController textEditingController) {
    return TextFormField(
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: labelText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(RadiusConstants.instance.circular16),
                  ),
                ),
              );
  }