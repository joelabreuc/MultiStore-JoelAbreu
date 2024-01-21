
import 'package:flutter/cupertino.dart';

class WithdrawalsScreen extends StatelessWidget{

  static const String routeName = '\WithdrawalsScreen';
  const WithdrawalsScreen({super.key});
  @override
  Widget build(BuildContext context){

    return SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Manage Withdrawals',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      );
  }

}