
import 'package:flutter/cupertino.dart';

class OrdersScreen extends StatelessWidget{
  static const String routeName = '\OrdersScreen';
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context){
    return  SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Manage Orders',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      );
  }

}