class WithDrawBankConModel {
  WithDrawBankConModel({
      this.code, 
      this.message, 
      this.result,});

  WithDrawBankConModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? code;
  String? message;
  Result? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }

}

class Result {
  Result({
      this.channel, 
      this.fromAccountName, 
      this.fromCoopAccountNo, 
      this.toAccountName, 
      this.toCoopAccountNo, 
      this.fromBayAccountNo, 
      this.toBayAccountNo, 
      this.transactionType, 
      this.transactionAmount, 
      this.transactionFee, 
      this.note, 
      this.transactionDate, 
      this.coopTransactionNo, 
      this.principalAmount, 
      this.interestAmount, 
      this.vourcherNo, 
      this.receiptNo, 
      this.epayPAYSERVICE, 
      this.epayTRANTYPE, 
      this.epayTRANSUBTYPE, 
      this.epayPAYREF, 
      this.epayKTBREF, 
      this.epayVENDORID, 
      this.epayISPID, 
      this.epayCUSTID, 
      this.epayREF1, 
      this.epayDBBANKCODE, 
      this.epayDBACCURRCODE, 
      this.epayACREF, 
      this.epayAMOUNT, 
      this.epayRESENDFLAG, 
      this.epayFEE, 
      this.epayPOSTDATE, 
      this.epayTRANTIME, 
      this.epayRSPCODE, 
      this.epayRSPMSG,});

  Result.fromJson(dynamic json) {
    channel = json['channel'];
    fromAccountName = json['from_account_name'];
    fromCoopAccountNo = json['from_coop_account_no'];
    toAccountName = json['to_account_name'];
    toCoopAccountNo = json['to_coop_account_no'];
    fromBayAccountNo = json['from_bay_account_no'];
    toBayAccountNo = json['to_bay_account_no'];
    transactionType = json['transaction_type'];
    transactionAmount = json['transaction_amount'];
    transactionFee = json['transaction_fee'];
    note = json['note'];
    transactionDate = json['transaction_date'];
    coopTransactionNo = json['coop_transaction_no'];
    principalAmount = json['principal_amount'];
    interestAmount = json['interest_amount'];
    vourcherNo = json['vourcher_no'];
    receiptNo = json['receipt_no'];
    epayPAYSERVICE = json['epay:PAY_SERVICE'];
    epayTRANTYPE = json['epay:TRAN_TYPE'];
    epayTRANSUBTYPE = json['epay:TRAN_SUB_TYPE'];
    epayPAYREF = json['epay:PAY_REF'];
    epayKTBREF = json['epay:KTB_REF'];
    epayVENDORID = json['epay:VENDOR_ID'];
    epayISPID = json['epay:ISP_ID'];
    epayCUSTID = json['epay:CUST_ID'];
    epayREF1 = json['epay:REF1'];
    epayDBBANKCODE = json['epay:DB_BANK_CODE'];
    epayDBACCURRCODE = json['epay:DB_AC_CURR_CODE'];
    epayACREF = json['epay:AC_REF'];
    epayAMOUNT = json['epay:AMOUNT'];
    epayRESENDFLAG = json['epay:RESEND_FLAG'];
    epayFEE = json['epay:FEE'];
    epayPOSTDATE = json['epay:POST_DATE'];
    epayTRANTIME = json['epay:TRAN_TIME'];
    epayRSPCODE = json['epay:RSP_CODE'];
    epayRSPMSG = json['epay:RSP_MSG'];
  }
  String? channel;
  String? fromAccountName;
  String? fromCoopAccountNo;
  String? toAccountName;
  String? toCoopAccountNo;
  String? fromBayAccountNo;
  String? toBayAccountNo;
  String? transactionType;
  String? transactionAmount;
  String? transactionFee;
  String? note;
  String? transactionDate;
  String? coopTransactionNo;
  String? principalAmount;
  String? interestAmount;
  String? vourcherNo;
  String? receiptNo;
  String? epayPAYSERVICE;
  String? epayTRANTYPE;
  String? epayTRANSUBTYPE;
  String? epayPAYREF;
  String? epayKTBREF;
  String? epayVENDORID;
  String? epayISPID;
  String? epayCUSTID;
  String? epayREF1;
  String? epayDBBANKCODE;
  String? epayDBACCURRCODE;
  String? epayACREF;
  String? epayAMOUNT;
  String? epayRESENDFLAG;
  String? epayFEE;
  String? epayPOSTDATE;
  String? epayTRANTIME;
  String? epayRSPCODE;
  String? epayRSPMSG;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channel'] = channel;
    map['from_account_name'] = fromAccountName;
    map['from_coop_account_no'] = fromCoopAccountNo;
    map['to_account_name'] = toAccountName;
    map['to_coop_account_no'] = toCoopAccountNo;
    map['from_bay_account_no'] = fromBayAccountNo;
    map['to_bay_account_no'] = toBayAccountNo;
    map['transaction_type'] = transactionType;
    map['transaction_amount'] = transactionAmount;
    map['transaction_fee'] = transactionFee;
    map['note'] = note;
    map['transaction_date'] = transactionDate;
    map['coop_transaction_no'] = coopTransactionNo;
    map['principal_amount'] = principalAmount;
    map['interest_amount'] = interestAmount;
    map['vourcher_no'] = vourcherNo;
    map['receipt_no'] = receiptNo;
    map['epay:PAY_SERVICE'] = epayPAYSERVICE;
    map['epay:TRAN_TYPE'] = epayTRANTYPE;
    map['epay:TRAN_SUB_TYPE'] = epayTRANSUBTYPE;
    map['epay:PAY_REF'] = epayPAYREF;
    map['epay:KTB_REF'] = epayKTBREF;
    map['epay:VENDOR_ID'] = epayVENDORID;
    map['epay:ISP_ID'] = epayISPID;
    map['epay:CUST_ID'] = epayCUSTID;
    map['epay:REF1'] = epayREF1;
    map['epay:DB_BANK_CODE'] = epayDBBANKCODE;
    map['epay:DB_AC_CURR_CODE'] = epayDBACCURRCODE;
    map['epay:AC_REF'] = epayACREF;
    map['epay:AMOUNT'] = epayAMOUNT;
    map['epay:RESEND_FLAG'] = epayRESENDFLAG;
    map['epay:FEE'] = epayFEE;
    map['epay:POST_DATE'] = epayPOSTDATE;
    map['epay:TRAN_TIME'] = epayTRANTIME;
    map['epay:RSP_CODE'] = epayRSPCODE;
    map['epay:RSP_MSG'] = epayRSPMSG;
    return map;
  }

}