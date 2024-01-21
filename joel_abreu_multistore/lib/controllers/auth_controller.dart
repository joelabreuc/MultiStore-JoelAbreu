import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:joel_abreu_multistore/views/buyers/auth/login_screen.dart';
import 'package:joel_abreu_multistore/views/buyers/main_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  User get user => _user.value!;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createNewUser(
      String email,
      String fullName,
      String password,
      String phoneNumber
      ) async {
    String res = 'some erorr occured';

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // String downloadUrl = await _uploadImageToStorage(image);

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'profileImage': '',
        'email': email,
        'uid': userCredential.user!.uid,
        'phoneNumber' :phoneNumber,
        'pinCode ': "",
        'locality': "",
        'city': '',
        'state': '',
      });

      res = 'success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    Map<String, dynamic> res = {'status': 'error', 'role': ''};

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot userDoc = await _firestore
          .collection('buyers') // Assuming buyers are stored in a 'buyers' collection
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        res = {
          'status': 'success',
          'role': 'buyer', // Set the role as 'buyer' for buyers
        };
      } else {
        res['status'] = 'Invalid user role or user not found.';
      }
    } catch (e) {
      res['status'] = e.toString();
    }

    return res;
  }


}