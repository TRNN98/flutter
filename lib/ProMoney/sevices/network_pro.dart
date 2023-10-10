import 'dart:convert';
import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/FollowMe/pages/auth/pins.dart';
import 'package:mwasc/promoney/class/myclasspro.dart';
import 'package:mwasc/promoney/models/account/account_model.dart';
import 'package:mwasc/promoney/models/admin/Share/statement_share_detail_model.dart';
import 'package:mwasc/promoney/models/admin/bookInOut/admin_io_model.dart';
import 'package:mwasc/promoney/models/link_account/link_account_model.dart';
import 'package:mwasc/promoney/models/loan_payment/loan_payment_check_model.dart';
import 'package:mwasc/promoney/models/pay/pay_check_model.dart';
import 'package:mwasc/promoney/models/tran/tran_check_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/history/history.dart';
import '../models/tran/tran_con_model.dart';
import '../models/tran_bank/tran_bankcheck_model.dart';
import '../models/tran_bank/tran_bankcon_model.dart';
import '../models/withdraw_bank/withdraw_bank_check_model.dart';
import '../models/withdraw_bank/withdraw_bank_con_model.dart';
import '../models/withdraw_loan/withdraw_loan_check_model.dart';
import '../models/withdraw_loan/withdraw_loan_con_model.dart';

class NetworkPro {
  static Future<List<LinkAccountModel>> fetchUnlinkAccount(
      data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/ktb/linkaccount/unlink');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      List jsonResponse1 = json.decode('[${response.body}]');
      final List jsonResponse =
          json.decode('[${json.encode(jsonResponse1[0]['result'])}]');
      List<LinkAccountModel> result =
          jsonResponse.map((i) => LinkAccountModel.fromJson(i)).toList();
      return result;
    } else {
      return [];
      // fetchCheckToken(token, context).then((value) => {
      //       if (value == 'ok')
      //         {_checkError(json.decode('[' + response.body + ']'),context)}
      //     });
    }
  }

  static Future<List<LinkAccountModel>> fetchLinkAccount(
      data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/ktb/linkaccount/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      List jsonResponse1 = json.decode('[${response.body}]');
      final List jsonResponse =
          json.decode('[${json.encode(jsonResponse1[0]['result'])}]');
      List<LinkAccountModel> result =
          jsonResponse.map((i) => LinkAccountModel.fromJson(i)).toList();
      return result;
    } else {
      return [];
      // fetchCheckToken(token, context).then((value) => {
      //       if (value == 'ok')
      //         {_checkError(json.decode('[' + response.body + ']'),context)}
      //     });
    }
  }

  static Future<List<StatementShareDetailModel>> fetchStatementShare(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/AdminAll');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<StatementShareDetailModel> result = jsonResponse
          .map((i) => StatementShareDetailModel.fromJson(i))
          .toList();
      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future fetchAdminShare(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/AdminAll');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };

    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) =>
      //             const Pins(gettitle: 'pinCode')),
      //     (Route<dynamic> route) => false);
      throw Exception('Failed to load post');
    }
  }

  static Future fetchChangShare(data, token, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/member_changeshare');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      return jsonResponse;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
  }

  static Future fetchCheckChangShare(data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/proadmin/vdcngshare');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      return 'ok#${jsonResponse[0]['message']}';
    } else {
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
    }
  }

  static Future<List<AccountModel>> fetchAccount(
      data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/coop/account/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode('[${response.body}]');
      List<AccountModel> result =
          jsonResponse.map((i) => AccountModel.fromJson(i)).toList();
      return result;
    } else {
      // fetchCheckToken(token, context).then((value) => {
      //       if (value == 'ok')
      //         {_checkError(json.decode('[' + response.body + ']'), context)}
      //     });
      throw Exception('Failed to load post');
    }
  }

  // static Future<List<PayCheckModel>> fetchBuyShareCheck(
  //     data, token, cooptoken, context) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/coop/buyshare/inquiry');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token',
  //     "coop-access-token": cooptoken
  //   };
  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode('[' + response.body + ']');
  //     List<PayCheckModel> result =
  //         jsonResponse.map((i) => PayCheckModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     MyClassPro.hiddenDialog(0, context);
  //     fetchCheckToken(token, context).then((value) => {
  //           if (value == 'ok')
  //             {_checkError(json.decode('[' + response.body + ']'), context)}
  //         });
  //     throw Exception('Failed to load post');
  //   }
  // }

  static Future<List<PayCheckModel>> fetchPayCheck(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/coop/loanpayment/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<PayCheckModel> result =
          jsonResponse.map((i) => PayCheckModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<LoanPaymentCheckModel>> fetchLoanPaymentCheck(
      data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/ktb/loanpayment/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<LoanPaymentCheckModel> result =
          jsonResponse.map((i) => LoanPaymentCheckModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<TranCheckModel>> fetchTranCheck(
      data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/coop/tranfer/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<TranCheckModel> result =
          jsonResponse.map((i) => TranCheckModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<TranBankCheckModel>> fetchTranBankCheck(
      data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/ktb/withdrawdep/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<TranBankCheckModel> result =
          jsonResponse.map((i) => TranBankCheckModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<WithDrawBankCheckModel>> fetchWithDrawBankCheck(
      data, token, cooptoken, context) async {
    final url =
        Uri.parse('${MyClass.hostApp()}/api/v1/member/ktb/deposit/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<WithDrawBankCheckModel> result =
          jsonResponse.map((i) => WithDrawBankCheckModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<WithDrawLoanCheckModel>> fetchWithDrawLoanCheck(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/ktb/withdrawloan/inquiry');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<WithDrawLoanCheckModel> result =
          jsonResponse.map((i) => WithDrawLoanCheckModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<TranConModel>> fetchTranConfirm(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/coop/tranfer/confirmation');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<TranConModel> result =
          jsonResponse.map((i) => TranConModel.fromJson(i)).toList();

      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkErrorPinPro(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<TranBankConModel>> fetchTranBankConfirm(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/ktb/withdrawdep/confirmation');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
      // "bay-access-token": bankToken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<TranBankConModel> result =
          jsonResponse.map((i) => TranBankConModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkErrorPinPro(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<WithDrawBankConModel>> fetchWithDrawConfirm(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/ktb/deposit/confirmation');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<WithDrawBankConModel> result =
          jsonResponse.map((i) => WithDrawBankConModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkErrorPinPro(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<WithDrawBankConModel>> fetchLoanPaymentConfirm(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/ktb/loanpayment/confirmation');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<WithDrawBankConModel> result =
          jsonResponse.map((i) => WithDrawBankConModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkErrorPinPro(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future<List<WithDrawLoanConModel>> fetchWithDrawLoanConfirm(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/ktb/withdrawloan/confirmation');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<WithDrawLoanConModel> result =
          jsonResponse.map((i) => WithDrawLoanConModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkErrorPinPro(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  // static Future<List<TranConModel>> fetchBuyShareConfirm(
  //     data, token, cooptoken, context) async {
  //   final url = Uri.parse(
  //       '${MyClass.hostApp()}/api/v1/member/coop/buyshare/confirmation');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token',
  //     "coop-access-token": cooptoken
  //   };
  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode('[' + response.body + ']');
  //     List<TranConModel> result =
  //         jsonResponse.map((i) => TranConModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     MyClassPro.hiddenDialog(0, context);
  //     fetchCheckToken(token, context).then((value) => {
  //           if (value == 'ok')
  //             {_checkError(json.decode('[' + response.body + ']'), context)}
  //         });
  //     throw Exception('Failed to load post');
  //   }
  // }

  static Future<List<HistoryModel>> fetchHistory(
      data, token, cooptoken, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/insertHistory');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data[0]);
    final response = await http.post(url, headers: headers, body: jsons);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<HistoryModel> result =
          jsonResponse.map((i) => HistoryModel.fromJson(i)).toList();
      return result;
    } else {
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  static Future fetchInsertHistory(data, token, cooptoken, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/insertHistory');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data[0]);
    final response = await http.post(url, headers: headers, body: jsons);
    if (response.statusCode == 200) {
    } else {
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkError(json.decode('[${response.body}]'), context)}
          });
    }
  }

  // static Future fetchInsertEditProfile(data, token, cooptoken, context) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/insertEditProfile');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token'
  //   };
  //   String jsons = json.encode(data[0]);
  //   final response = await http.post(url, headers: headers, body: jsons);
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode(response.body);
  //     return jsonResponse;
  //   } else {
  //     fetchCheckToken(token, context).then((value) => {
  //           if (value == 'ok')
  //             {_checkError(json.decode('[' + response.body + ']'), context)}
  //         });
  //   }
  // }
  //
  // static Future<List<DetailStatusModel>> fetchDetailStatus(
  //     data, token, context) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/insertEditProfile');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token'
  //   };
  //   String jsons = json.encode(data[0]);
  //   final response = await http.post(url, headers: headers, body: jsons);
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode(response.body);
  //     List<DetailStatusModel> result =
  //         jsonResponse.map((i) => DetailStatusModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     fetchCheckToken(token, context).then((value) => {
  //           if (value == 'ok')
  //             {_checkError(json.decode('[' + response.body + ']'), context)}
  //         });
  //     throw Exception('Failed to load post');
  //   }
  // }
  //
  // static Future<List<DetailBorrowModel>> fetchDetailBorrow(
  //     data, token, context) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/insertEditProfile');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token'
  //   };
  //   String jsons = json.encode(data[0]);
  //   final response = await http.post(url, headers: headers, body: jsons);
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode(response.body);
  //     List<DetailBorrowModel> result =
  //         jsonResponse.map((i) => DetailBorrowModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     fetchCheckToken(token, context).then((value) => {
  //           if (value == 'ok')
  //             {_checkError(json.decode('[' + response.body + ']'), context)}
  //         });
  //     throw Exception('Failed to load post');
  //   }
  // }

  static Future<List<TranConModel>> fetchPayConfirm(
      data, token, cooptoken, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/coop/loanpayment/confirmation');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token',
      "coop-access-token": cooptoken
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      List<TranConModel> result =
          jsonResponse.map((i) => TranConModel.fromJson(i)).toList();
      return result;
    } else {
      MyClassPro.hiddenDialog(0, context);
      fetchCheckToken(token, context).then((value) => {
            if (value == 'ok')
              {_checkErrorPinPro(json.decode('[${response.body}]'), context)}
          });
      throw Exception('Failed to load post');
    }
  }

  // static Future<List<PinModel>> fetchToken(data, token) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/coop/oauth/token');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token'
  //     // "coop-access-token": "13131949-247e-4472-8768-da083c8760ac"
  //   };
  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode('[' + response.body + ']');
  //     List<PinModel> result =
  //         jsonResponse.map((i) => PinModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     return [];
  //   }
  // }
  //
  // static Future<List<AccountBayModel>> fetchAccountBay(
  //     data, token, cooptoken, context) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/scb/linkaccount/inquiry');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token',
  //     "coop-access-token": cooptoken
  //   };
  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode('[' + response.body + ']');
  //     List<AccountBayModel> result =
  //         jsonResponse.map((i) => AccountBayModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     return [];
  //   }
  // }
  //
  // static Future<List<AccountBayModel>> fetchUnlinkAccountBay(
  //     data, token, cooptoken, context) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/scb/linkaccount/unlink');
  //
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token',
  //     "coop-access-token": cooptoken
  //   };
  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode('[' + response.body + ']');
  //     List<AccountBayModel> result =
  //         jsonResponse.map((i) => AccountBayModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     return [];
  //   }
  // }
  //
  // static Future<List<AccountBayModel>> fetchLinkAccountBay(
  //     data, token, cooptoken, context) async {
  //   final url =
  //       Uri.parse('${MyClass.hostApp()}/api/v1/member/scb/linkaccount/inquiry');
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     "Authorization": 'Bearer $token',
  //     "coop-access-token": cooptoken
  //   };
  //   String jsons = json.encode(data);
  //   final response =
  //       await http.post(url, headers: headers, body: json.decode(jsons));
  //   if (response.statusCode == 200) {
  //     final List jsonResponse = json.decode('[' + response.body + ']');
  //     List<AccountBayModel> result =
  //         jsonResponse.map((i) => AccountBayModel.fromJson(i)).toList();
  //     return result;
  //   } else {
  //     fetchCheckToken(token, context).then((value) => {
  //           if (value == 'ok')
  //             {_checkError(json.decode('[' + response.body + ']'), context)}
  //         });
  //     throw Exception('Failed to load post');
  //   }
  // }
  //
  static Future fetchCheckToken(token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/checkToken');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode('{}');
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
      return 'NoData';
    }
  }

  static Future fetchGetBorrow(data, token, context) async {
    final url = Uri.parse(
        '${MyClass.hostApp()}/api/v1/member/get_pro_admin_loan_request_list');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode('[${response.body}]');
      return jsonResponse;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
  }

  static Future fetchDeviceStatus(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/deviceProStatus');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
  }

  static Future<List<AdminIoModel>> fetchAdminIO(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/AdminAll');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AdminIoModel> result =
          jsonResponse.map((i) => AdminIoModel.fromJson(i)).toList();
      return result;
    }
    throw Exception('Failed to load post');
  }

  static Future<List<AdminIoDetailModel>> fetchAdminIODetail(
      data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/AdminAll');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse = json.decode(response.body);
      List<AdminIoDetailModel> result =
          jsonResponse.map((i) => AdminIoDetailModel.fromJson(i)).toList();
      return result;
    }
    throw Exception('Failed to load post');
  }

  static _checkError(data, context) {
    try {
      List check = data;
      MyClassPro.showAlertPro(check[0]['errors']['errormessage'], context);
    } catch (e) {
      MyClassPro.showAlertPro('เกิดข้อผิดพลาด', context);
    }
  }

  static _checkErrorPinPro(data, context) {
    try {
      List check = data;
      MyClassPro.showAlertProPinPro(
          check[0]['errors']['errormessage'], context);
    } catch (e) {
      MyClassPro.showAlertProPinPro('เกิดข้อผิดพลาด', context);
    }
  }

  static Future fetchSentOtp(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/send_otp');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse =
          json.decode('[${response.body.replaceAll('{}', '')}]');
      return jsonResponse;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
  }

  static Future fetchVerifyOtp(data, token, context) async {
    final url = Uri.parse('${MyClass.hostApp()}/api/v1/member/verify_otp');
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer $token'
    };
    String jsons = json.encode(data);
    final response =
        await http.post(url, headers: headers, body: json.decode(jsons));
    if (response.statusCode == 200) {
      final List jsonResponse =
          json.decode('[${response.body.replaceAll('{}', '')}]');
      return jsonResponse;
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Pins(gettitle: 'pinCode')),
          (Route<dynamic> route) => false);
    }
  }
}
