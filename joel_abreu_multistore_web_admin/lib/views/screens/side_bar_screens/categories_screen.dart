import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '\Categories';


  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  dynamic _image;
  String? fileName;
  String? categoryName;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false, type: FileType.image
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;

        fileName = result.files.first.name;
      });
    }
  }

  uploadCategoryType() async {
    EasyLoading.show();
    if (_formKey.currentState!.validate()) {
      String imageurl = await _uploadCategoryBannerToStorage(_image);

      await _firestore.collection('categories').doc(fileName).set({
        'image': imageurl,
        'categoryName': categoryName
      }).whenComplete(() =>
          EasyLoading.dismiss()
    );

    print('Good Print');

    }else{
    print('Bad Print');
    EasyLoading.dismiss();
    }
  }

  _uploadCategoryBannerToStorage(dynamic imageSelected) async {
    Reference ref = _storage.ref().child('categoryImages').child(fileName!);
    UploadTask uploadTask = ref.putData(imageSelected);
    TaskSnapshot snapshot = await uploadTask;
    String Url = await snapshot.ref.getDownloadURL();

    return Url;
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Categories',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _image != null ?
                          Image.memory(_image, fit: BoxFit.cover,
                          ) : Center(
                            child: Text('Category'),
                          )
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow.shade900),
                        onPressed: () {
                          pickImage();
                        },
                        child: Text('Upload'),
                      )
                    ],
                  ),
                ),
                Flexible(
                    child: SizedBox(
                      width: 260,
                      child: TextFormField(
                        onChanged: (value) {
                          categoryName = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Favor colocar un valor';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter the category new',
                          hintText: 'What is new to introdue',
                        ),
                      ),
                    )),
                SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(primary: Colors.yellow.shade900),
                  onPressed: () {
                    uploadCategoryType();
                  },
                  child: Text('Save'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
