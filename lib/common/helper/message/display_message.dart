import 'package:flutter/material.dart';

class DisplayMessage {
  // ERROR MESSAGE (Merah)
  static void errorMessage(String message, BuildContext context) {
    var snackbar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.red[700],
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  // SUCCESS MESSAGE (Desain elegan untuk login/signup berhasil)
  static void successMessage(String message, BuildContext context) {
    var snackbar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.green[700], // Warna sukses yang elegan
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
