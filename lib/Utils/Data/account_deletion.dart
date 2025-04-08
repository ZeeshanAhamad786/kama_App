import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class AccountManager {
  static Future<void> deleteCurrentUserAccount(BuildContext context) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Get.snackbar("Error", "No user is currently logged in.",
            backgroundColor: Colors.red, colorText: Colors.white);
        return;
      }

      // Prompt user to confirm deletion
      bool? confirm = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Delete Account"),
          content: Text(
              "Are you sure you want to delete your account? This action cannot be undone."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // Cancel
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // Confirm
              child: Text("Delete"),
            ),
          ],
        ),
      );

      if (confirm == true) {
        // Step 1: Declare password variable outside the dialog
        String? password;

        // Step 2: Prompt for password (or use another re-authentication method)
        password = await showDialog<String>(
          context: context,
          builder: (context) {
            String? enteredPassword; // Declare a local variable inside the dialog
            return AlertDialog(
              title: Text("Re-authenticate"),
              content: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Enter your password"),
                onChanged: (value) {
                  enteredPassword = value; // Update the entered password
                },
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, null), // Cancel
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, enteredPassword), // Confirm
                  child: Text("Submit"),
                ),
              ],
            );
          },
        );

        if (password == null || password.isEmpty) {
          Get.snackbar("Error", "Password is required for re-authentication.",
              backgroundColor: Colors.red, colorText: Colors.white);
          return;
        }

        // Step 2: Re-authenticate user
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!, // Assuming user email is available
          password: password,
        );

        try {
          await user.reauthenticateWithCredential(credential);

          // Step 3: Proceed with deleting the account
          // Delete user data from Firestore
          await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();

          // Delete user from Firebase Authentication
          await user.delete();

          // Navigate to login or welcome screen
          //  Get.offAll(() => LoginScreen()); // Replace with your route
          Get.snackbar("Success", "Your account has been deleted successfully.",
              backgroundColor: Colors.green, colorText: Colors.white);
        } catch (e) {
          // ye call krna hai dosri screen se jahandelete button ho ga
          AccountManager.deleteCurrentUserAccount(context);
          Get.snackbar("Error", "Re-authentication failed. Please check your password.",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
    } catch (e) {
      if (e.toString().contains('requires-recent-login')) {
        // This occurs if the user hasn't logged in recently and needs to re-authenticate
        Get.snackbar("Error",
            "Please log in again to delete your account for security reasons.",
            backgroundColor: Colors.orange, colorText: Colors.white);
      } else {
        // Handle any other errors
        Get.snackbar("Error", e.toString(),
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }
}
