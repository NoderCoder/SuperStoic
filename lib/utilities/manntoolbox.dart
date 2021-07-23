import 'package:flutter/material.dart';
class MannToolBox {
  // validate password and pop up window
   MannToolBox();

  String validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    // for stronger password
    // r'^
    //   (?=.*[A-Z])       // should contain at least one upper case
    //   (?=.*[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])      // should contain at least one digit
    //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    //     .{8,}             // Must be at least 8 characters in length
    // $;
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Please enter a minimum of 6 letter password';
      else
        return value;
    }
  }

}



