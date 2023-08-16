import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // final StringBuffer newText = StringBuffer();
    // newText.write(neatCost(newValue.text.replaceAll(",", "")));
    // RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)
    return TextEditingValue(
      // text: newValue.text ,
      text: NumberFormat.simpleCurrency(name: '')
          .format(double.parse(newValue.text)),
      //   selection: TextSelection.collapsed(
      //       offset: newValue.text.length),
      //       // offset: neatCost(newValue.text.replaceAll(",", "")).length),
    );
  }
}

String neatCost(String cost) {
  String res = cost;

  // double x =  double.parse(res);
  // res = NumberFormat.simpleCurrency(name: '').format(x);
  // print(res);
  // var x = res;
  // var y = ".";
  // var match = x.contains(y);
  // if(match == true){
  //   for (int i = 3; i < res.split('.')[0].length; i += 4) {
  //     // res = res.replaceRange(res.length - i, res.length - i, ",");
  //     res = res.split('.')[0].replaceRange(res.split('.')[0].length - i, res.split('.')[0].length - i, ",");
  //   }
  //   try{
  //     if(cost.split('.')[1].length > 0){
  //       res = res + '.' + cost.split('.')[1];
  //     }else{
  //       res = res + '.' ;
  //     }
  //   } catch (e) {
  //   }
  // }else{
  //   for (int i = 3; i < res.length; i += 4) {
  //     res = res.replaceRange(res.length - i, res.length - i, ",");
  //   }
  // }
  for (int i = 3; i < res.length; i += 4) {
    res = res.replaceRange(res.length - i, res.length - i, ",");
  }
  // res =  NumberFormat.simpleCurrency(name: '').format(12345.435);
  return res;
}
