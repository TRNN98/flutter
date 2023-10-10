import 'package:mwasc/FollowMe/class/myclass.dart';

class Language {
  // MainMenu
  static reandfo(m, l) {
    if (m == 'regis') {
      return l == 'en' ? "Membership Registration" : "ลงทะเบียนสมาชิก";
    }
    if (m == 'forget') {
      return l == 'en' ? "Forgot Password" : "ลืมรหัสผ่าน";
    }
    if (m == 'name') {
      return l == 'en' ? "Name " : "ชื่อ";
    }
    if (m == 'lastName') {
      return l == 'en' ? "Last Name" : "นามสกุล";
    }
  }

  static menuLg(m, l) {
    if (m == 'share') {
      return l == 'en' ? "Share" : "ทุนเรือนหุ้น";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "หนี้เงินกู้";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'guarantee') {
      return l == 'en' ? "Guarantee" : "ภาระค้ำประกัน\nสัญญาเงินกู้";
    }
    if (m == 'kept') {
      return l == 'en' ? "Billed Monthly" : "เรียกเก็บ\nรายเดือน";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "ปันผล\nเฉลี่ยคืน";
    }
    if (m == 'gain') {
      return l == 'en' ? "Beneficiary" : "ผู้รับโอนผลประโยชน์";
    }
    if (m == 'memberref') {
      return l == 'en' ? "Beneficiary" : "สมาชิกสมทบ";
    }
    if (m == 'new') {
      return l == 'en' ? "New" : "ข่าวประชาสัมพันธ์";
    }
    if (m == 'welcome') {
      return l == 'en' ? "Welcome" : "ยินดีต้อนรับ";
    }
    if (m == 'offset') {
      return l == 'en' ? "offset" : "รายการหักกลบหนี้";
    }
    if (m == 'calculate') {
      return l == 'en' ? "calculate" : "คำนวณสิทธิ์กู้";
    }
    if (m == 'trackStatus') {
      return l == 'en' ? "trackStatus" : "หนังสือ รับ-ส่ง";
    }
    if (m == 'diluteShares') {
      return l == 'en' ? "dilute Shares" : "เพิ่ม-ลด หุ้น";
    }
    if (m == 'welfare') {
      return l == 'en' ? "Welfare" : "สวัสดิการสมาชิก";
    }
    if (m == 'cremation') {
      return l == 'en' ? "Cremation" : "สส.อด.";
    }
    if (m == 'creditinsure') {
      return l == 'en' ? "Credit Insure" : "ประกันสินเชื่อ";
    }
    if (m == 'grouplife') {
      return l == 'en' ? "Group Life" : "ประกันกลุ่มเพิ่มสวัสดิการ";
    }
    if (m == 'welmaster') {
      return l == 'en' ? "" : "สมาคมฌาปนกิจ";
    }
    if (m == 'paymentbirthday') {
      return l == 'en' ? "Payment Birthday" : "สวัสดิการวันเกิดสมาชิก";
    }
    if (m == 'retire') {
      return l == 'en' ? "Retire" : "สวัสดิการบำเหน็จสมาชิก";
    }
    if (m == 'welfarereceive') {
      return l == 'en' ? "Welfare Receive" : "สวัสดิการ สคส 60 ปี";
    }
    if (m == 'requestforwelfare') {
      return l == '' ? "สวัสดิการ" : "สวัสดิการ";
    }
    if (m == 'UploadDocument') {
      return l == 'en' ? "อัพโหลดหลักฐาน" : "อัพโหลดหลักฐาน";
    }
    if (m == 'MemberSeminar') {
      return l == 'en' ? "การสัมมนาสมาชิก" : "การสัมมนาสมาชิก";
    }

    // การสัมมนาสมาชิก
  }

  static shareLg(m, l) {
    if (m == 'shareContractInformation') {
      return l == 'en'
          ? "Share Contract Information"
          : "รายละเอียดทุนเรือนหุ้น";
    }
    if (m == 'ShareMonth') {
      return l == 'en' ? "Sstatus" : "หุ้นเรียกเก็บ";
    }
    if (m == 'Sstatus') {
      return l == 'en' ? "Sstatus" : "สถานะการส่งรายเดือน";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'share') {
      return l == 'en' ? "Share" : "ทุนเรือนหุ้น";
    }
    if (m == 'period') {
      return l == 'en' ? "Period" : "งวดล่าสุด";
    }
    if (m == 'monthlyShare') {
      return l == 'en' ? "Monthly share" : "หุ้นรายเดือน";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "มูลค่าหุ้น";
    }
    if (m == 'amountM') {
      return l == 'en' ? "" : "ยอดคงเหลือ";
    }
  }

  static loanLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "หนี้เงินกู้";
    }
    if (m == 'contractStartDate') {
      return l == 'en' ? "Contract start date  " : "วันที่เริ่มสัญญา";
    }
    if (m == 'period') {
      return l == 'en' ? "Period  " : "งวดล่าสุด";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'paymentInInstallments') {
      return l == 'en' ? "Payment installments: " : "ส่งชำระงวดละ";
    }
    if (m == 'loanContractInformation') {
      return l == 'en'
          ? "Loan contract information"
          : "ข้อมูลรายละเอียดสัญญาเงินกู้";
    }
    if (m == 'listOfLoanAgreements') {
      return l == 'en' ? "List of loan agreements" : "รายการสัญญาเงินกู้";
    }
    if (m == 'loanContractNumber') {
      return l == 'en' ? "Loan contract number" : "เลขที่สัญญา";
    }
    if (m == 'approvalLimit') {
      return l == 'en' ? "Approval limit" : "ยอดอนุมัติ";
    }
    if (m == 'periodAll') {
      return l == 'en' ? "Period All" : "จำนวนงวด";
    }
    if (m == 'payment') {
      return l == 'en' ? "Payment" : "การชำระ";
    }
    if (m == 'balance') {
      return l == 'en' ? "Balance" : "หนี้คงเหลือ";
    }
    if (m == 'showGuarantees') {
      return l == 'en' ? "Guarantees" : "ดูหลักประกัน";
    }
    if (m == 'showMovementlist') {
      return l == 'en' ? "Movement" : "ดูรายการเคลื่อนไหว";
    }
    if (m == 'loanMovementlist') {
      return l == 'en' ? "Movement" : "รายการเคลื่อนไหวหนี้";
    }
    if (m == 'guaranteeAmount') {
      return l == 'en' ? "Guarantee amount" : "ยอดค้ำประกัน";
    }
    if (m == 'collateralForLoanAgreement') {
      return l == 'en'
          ? "Collateral for loan agreement"
          : "หลักประกันสัญญาเงินกู้";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
    if (m == 'amountLoan') {
      return l == 'en' ? "amount Loan" : "หนี้คงเหลือ";
    }
    if (m == 'loan_interest_rate') {
      return l == 'en' ? "loan_interest_rate" : "อัตราดอกเบี้ย";
    }
    if (m == 'collateralDescription') {
      return l == 'en' ? "Collateral Description" : "ประเภทหลักประกัน";
    }

    if (m == 'loanApprove') {
      return l == 'en' ? "LoanApprove" : "วงเงินค้ำประกัน";
    }
  }

  static deposit(m, l) {
    if (m == 'depositContractInformation') {
      return l == 'en'
          ? "Deposit contract information"
          : "ข้อมูลรายละเอียดบัญชีเงินฝาก";
    }
    if (m == 'depositBalanceAll') {
      return l == 'en' ? "depositBalanceAll" : "ยอดเงินคงเหลือทั้งหมด";
    }
    if (m == 'balanceH') {
      return l == 'en' ? "balance" : "คงเหลือ";
    }
    if (m == 'balance') {
      return l == 'en' ? "balance" : "ยอดคงเหลือ";
    }
    if (m == 'guaranteeAmount') {
      return l == 'en' ? "guaranteeAmount" : "เงินที่ค้ำประกัน";
    }
    if (m == 'monthlyDepositAmount') {
      return l == 'en' ? "Monthly deposit amount" : "เงินฝากรายเดือน";
    }
    if (m == 'currentInterestRate') {
      return l == 'en' ? "current interest rate" : "ดอกเบี้ยสะสม";
    }
    if (m == 'atmCoop') {
      return l == 'en' ? "atm-Coop" : "ATM-CO-OP";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'depositAccountDetails') {
      return l == 'en' ? "Deposit account details" : "รายละเอียดบัญชีเงินฝาก";
    }
    if (m == 'accountNumber') {
      return l == 'en' ? "Account Number" : "เลขที่บัญชี";
    }
    if (m == 'accountName') {
      return l == 'en' ? "Account Name" : "ชื่อบัญชี";
    }
    if (m == 'accountType') {
      return l == 'en' ? "Account Type" : "ประเภทบัญชี";
    }
    if (m == 'accountOpeningDate') {
      return l == 'en' ? "Account open date" : "วันที่เปิดบัญชี";
    }
    if (m == 'remainingAmount') {
      return l == 'en' ? "Remaining amount" : "จำนวนเงินคงเหลือ";
    }
    if (m == 'amountWithdrawn') {
      return l == 'en' ? "Amount withdrawn" : "จำนวนเงินที่ถอนได้";
    }
    if (m == 'seeMovements') {
      return l == 'en' ? "Account movements" : "ดูรายการเคลื่อนไหว";
    }
    if (m == 'accountMovements') {
      return l == 'en' ? "Account movements" : "รายการเคลื่อนไหวบัญชี";
    }
  }

  static guaranteeLg(m, l) {
    if (m == 'LoanApprove') {
      return l == 'en' ? "LoanApprove" : "วงเงินค้ำประกัน";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'guaranteeLoanAgreement') {
      return l == 'en'
          ? "Guarantee the loan agreement"
          : "ค้ำประกันสัญญาเงินกู้";
    }
    if (m == 'loanCollateral') {
      return l == 'en' ? "Loan collateral" : "หลักประกันเงินกู้";
    }
    if (m == 'guarantees') {
      return l == 'en' ? "Guarantees" : "การค้ำประกัน";
    }
    if (m == 'detail') {
      return l == 'en' ? "detail" : "รายการค้ำประกัน";
    }
    if (m == 'debt') {
      return l == 'en' ? "Debt" : "ยอดคงเหลือ";
    }
  }

  static dividendLg(m, l) {
    if (m == 'rate') {
      return l == 'en' ? "rate" : "ดอกเบี้ยสะสมระหว่างปี(บาท)";
    }
    if (m == 'accumulatedInterest') {
      return l == 'en' ? "Accumulated Interest" : "ดอกเบี้ยสะสม";
    }
    if (m == 'bank') {
      return l == 'en' ? "bank" : "เลขที่บัญชี";
    }
    if (m == 'RefundDate') {
      return l == 'en' ? "Refund date" : "วันที่จ่ายคืน";
    }
    if (m == 'paymentDate') {
      return l == 'en' ? "payment date" : "วันที่จ่าย";
    }
    if (m == 'payBack') {
      return l == 'en' ? "pay back" : "จ่ายคืน(บาท)";
    }
    if (m == 'loanContractNo') {
      return l == 'en' ? "Loan Contract No" : "เลขที่สัญญา";
    }
    if (m == 'totalNetReceipts') {
      return l == 'en' ? "Total net receipts" : "รวมรับ";
    }
    if (m == 'status') {
      return l == 'en' ? "Status" : "สถานะ";
    }
    if (m == 'status') {
      return l == 'en' ? "Status" : "สถานะ";
    }
    if (m == 'payOffDebt') {
      return l == 'en' ? "pay off debt" : "ชำระหนี้(บาท)";
    }
    if (m == 'dividendRate') {
      return l == 'en' ? "Dividend rate" : "อัตราปันผล";
    }
    if (m == 'averageRate') {
      return l == 'en' ? "Average refund rate" : "อัตราเฉลี่ยคืน";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "ปันผล";
    }
    if (m == 'averageRefund') {
      return l == 'en' ? "Average refund" : "เฉลี่ยคืน";
    }
    if (m == 'dividendAverageRefund') {
      return l == 'en' ? "Dividend-Average refund" : "ปันผล-เฉลี่ยคืน";
    }
    if (m == 'fiscalYear') {
      return l == 'en' ? "Fiscal year" : "ปีบัญชี";
    }
    if (m == 'getMoney') {
      return l == 'en' ? "Get money" : "รวมรับสุทธิ";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'dividendAverageDetail') {
      return l == 'en' ? "Dividend-Average Detail" : "จ่ายเงินปันผล-เฉลี่ยคืน";
    }
    if (m == 'printDividend') {
      return l == 'en' ? "printDividend" : "พิมพ์รายการ ปันผล-เฉลี่ยคืน";
    }
  }

  static gainLg(m, l) {
    if (m == 'typeaccount') {
      return l == 'en' ? "typeaccount" : "ประเภทการจ่าย";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'gain') {
      return l == 'en' ? "Beneficiary" : "ผู้รับโอนผลประโยชน์";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "บัตรประชาชน";
    }
    if (m == 'relationship') {
      return l == 'en' ? "relationship" : "ความสัมพันธ์";
    }
  }

  static keptLg(m, l) {
    if (m == 'AmounLob') {
      return l == 'en' ? "AmounLob" : "เงินติดลบ";
    }
    if (m == 'AmounNot') {
      return l == 'en' ? "AmounNot" : "เงินเก็บได้";
    }
    if (m == 'CountDetail') {
      return l == 'en' ? "CountDetail" : "จำนวนรายการ";
    }
    if (m == 'StatusReceipt') {
      return l == 'en' ? "StatusReceipt" : "สถานะ";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'kept') {
      return l == 'en' ? "Billed Monthly" : "เรียกเก็บเงินรายเดือน";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'receiptNumber') {
      return l == 'en' ? "Receipt number" : "เลขที่ใบเสร็จ";
    }
    if (m == 'receiptDate') {
      return l == 'en' ? "Receipt Date" : "วันที่ใบเสร็จ";
    }
    if (m == 'billedCharge') {
      return l == 'en' ? "Billed Charge" : "ยอดเรียกเก็บ";
    }
    if (m == 'additionalAmountPaid') {
      return l == 'en' ? "Additional Amount to be Paid" : "ยอดที่ต้องชำระเพิ่ม";
    }
    if (m == 'month') {
      return l == 'en' ? "Month" : "เดือน";
    }
    if (m == 'year') {
      return l == 'en' ? "Year" : "ปี";
    }
    if (m == 'printBilledMonthly') {
      return l == 'en' ? "Print Billed Monthly" : "พิมพ์ใบเสร็จ";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
    if (m == 'receipt') {
      return l == 'en' ? "Receipt" : "ใบเสร็จรับเงิน";
    }
    if (m == 'billingStatement') {
      return l == 'en' ? "Billing statement" : "ใบแจ้งยอดเรียกเก็บ ";
    }
    if (m == 'canNotPrint') {
      return l == 'en'
          ? "Still can't print the receipt. Because the transaction has not yet been posted"
          : "ยังไม่สามารถพิมพ์ใบเสร็จได้ เนื่องจากยังไม่ผ่านรายการ";
    }

    if (m == 'totalPaid') {
      return l == 'en' ? "Total" : "รวมได้รับชำระ";
    }
  }

  static memberrefLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'memberref') {
      return l == 'en' ? "Share Detail" : "รายละเอียดทุนเรือนหุ้น";
    }
    if (m == 'memberrefs') {
      return l == 'en' ? "Share" : "สมาชิกสมทบ";
    }
    if (m == 'loan') {
      return l == 'en' ? "Loan" : "หนี้เงินกู้";
    }
    if (m == 'monthlyShare') {
      return l == 'en' ? "Monthly share" : "หุ้นรายเดือน";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'period1') {
      return l == 'en' ? "Period" : "งวด";
    }
    if (m == 'deposit') {
      return l == 'en' ? "Deposit" : "เงินฝาก";
    }
    if (m == 'dividend') {
      return l == 'en' ? "Dividend" : "ปันผล";
    }
  }

  static profileLg(m, l) {
    if (m == 'position') {
      return l == 'en' ? "Position" : "ตำแหน่ง";
    }
    if (m == 'share_stock') {
      return l == 'en' ? "Share Stock" : "ทุนเรือนหุ้น";
    }
    if (m == 'member_group_prename') {
      return l == 'en' ? "member_group_prename" : "หน่วยงาน";
    }
    if (m == 'salary') {
      return l == 'en' ? "Salary" : "เงินเดือน";
    }
    if (m == 'mem_status') {
      return l == 'en' ? "mem_status" : "ประเภท";
    }
    if (m == 'birthday') {
      return l == 'en' ? "Birthday" : "วันเกิด";
    }
    if (m == 'dateOfMembership') {
      return l == 'en' ? "Date of membership" : "วันที่เป็นสมาชิก";
    }
    if (m == 'address') {
      return l == 'en' ? "Address" : "ที่อยู่";
    }
    if (m == 'present_telephone') {
      return l == 'en' ? "present_telephone" : "เบอร์โทรบ้าน";
    }
    if (m == 'BANK_ACC_NO') {
      return l == 'en' ? "BANK_ACC_NO" : "เลขที่บัญชี";
    }
    if (m == 'mem_type') {
      return l == 'en' ? "Status" : "สถานะ";
    }
    if (m == 'mem_status') {
      return l == 'en' ? "mem_status" : "ประเภท";
    }
    if (m == 'GROUP_PAY_DES') {
      return l == 'en' ? "GROUP_PAY_DES" : "วิธีรับปันผล";
    }
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "บัตรประชาชน";
    }
    if (m == 'dateOfRegisingation') {
      return l == 'en' ? "Date of Regisingation" : "วันที่ลาออก";
    }
    if (m == 'phone') {
      return l == 'en' ? "Phone" : "เบอร์โทรศัพท์";
    }
    if (m == 'department') {
      return l == 'en' ? "Department: " : "หน่วยงาน";
    }

    if (m == 'profile') {
      return l == 'en' ? "Profile" : "ข้อมูลส่วนตัว";
    }
    if (m == 'camera') {
      return l == 'en' ? "Camera" : "กล้อง";
    }
    if (m == 'gallery') {
      return l == 'en' ? "Gallery" : "คลังภาพ";
    }
    if (m == 'cancel') {
      return l == 'en' ? "Cancel" : "ยกเลิก";
    }
    if (m == 'upload') {
      return l == 'en' ? "Upload" : "เปลี่ยน";
    }
    if (m == 'MARRIAGE_STATUS') {
      return l == 'en' ? "MARRIAGE_STATUS" : "สถานภาพ: ";
    }
    if (m == 'BANK_NAME') {
      return l == 'en' ? "BANK_NAME" : "ธนาคาร: ";
    }
  }

  static welfareLg(m, l) {
    if (m == 'welfare') {
      return l == 'en' ? "Welfare" : "สวัสดิการสมาชิก";
    }
    if (m == 'welfareDetail') {
      return l == 'en' ? "Welfare Detail" : "รายละเอียดสวัสดิการ";
    }
    if (m == 'welfareInformation') {
      return l == 'en' ? "Welfare Information" : "ข้อมูลรายละเอียดสวัสดิการ";
    }
    if (m == 'type') {
      return l == 'en' ? "Type" : "ประเภท";
    }
    if (m == 'number') {
      return l == 'en' ? "Number" : "เลขที่";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ-สกุล";
    }
    if (m == 'belongsTo') {
      return l == 'en' ? "Belongs to" : "เป็นของ";
    }
    if (m == 'paidMoney') {
      return l == 'en' ? "Paid Money" : "เงินชำระแล้ว";
    }
    if (m == 'status') {
      return l == 'en' ? "Status" : "สถานะ";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'birthday') {
      return l == 'en' ? "Birthday" : "วันเกิด";
    }
    if (m == 'applicationDate') {
      return l == 'en' ? "Application Date" : "วันที่สมัคร";
    }
    if (m == 'resignationDate') {
      return l == 'en' ? "Resignation Date" : "วันที่ลาออก";
    }
  }

  static cremationLg(m, l) {
    if (m == 'cremation') {
      return l == 'en' ? "Cremation" : "สส.อด.";
    }
    if (m == 'ss_id') {
      return l == 'en' ? "SS_ID" : "รหัส สส.อด.";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ-สกุล";
    }
    if (m == 'relation') {
      return l == 'en' ? "Relation" : "ความสัมพันธ์";
    }
    if (m == 'status') {
      return l == 'en' ? "Status" : "สถานะ";
    }
  }

  static UploadDoc(m, l) {
    if (m == 'UploadDocument') {
      return l == 'en' ? "อัพโหลดหลักฐาน" : "อัพโหลดหลักฐาน";
    }
  }

  static memberSeminar(m, l) {
    if (m == 'memberSeminar') {
      return l == 'en' ? "การสัมมนาสมาชิก" : "การสัมมนาสมาชิก";
    }
    if (m == 'history') {
      return l == 'en' ? "history" : "ประวัติการสัมมนาสมาชิก";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่สัมมนา";
    }
  }

  static creditinsureLg(m, l) {
    if (m == 'creditinsure') {
      return l == 'en' ? "Credit Insure" : "ประกันสินเชื่อ";
    }
    if (m == 'creditinsureDetail') {
      return l == 'en' ? "Credit Insure Detail" : "รายละเอียดสินเชื่อและประกัน";
    }
    if (m == 'creditinsureInformation') {
      return l == 'en' ? "Credit Insure" : "ข้อมูลรายละเอียดสินเชื่อประกัน";
    }
    if (m == 'contractNumber') {
      return l == 'en' ? "Contract Number" : "เลขที่สัญญา";
    }
    if (m == 'loanType') {
      return l == 'en' ? "Loan Type" : "ประเภทเงินกู้";
    }
    if (m == 'insuranceType') {
      return l == 'en' ? "Insurance Type" : "ประเภทประกัน";
    }
    if (m == 'beginingOfContract') {
      return l == 'en' ? "Begining Of Contract" : "วันที่ทำประกัน";
    }
    if (m == 'sumInsured') {
      return l == 'en' ? "Sum Insured" : "ทุนประกัน";
    }
    if (m == 'creditInsurancePremiums') {
      return l == 'en' ? "Credit Insurance Premiums" : "เบี้ยประกันสินเชื่อ";
    }
    if (m == 'fireInsurancePremiums') {
      return l == 'en' ? "Fire Insurance Premiums" : "เบี้ยประกันอัคคีภัย";
    }
    if (m == 'outstandingDebt') {
      return l == 'en' ? "Outstanding Debt" : "หนี้คงเหลือ";
    }
    if (m == 'note') {
      return l == 'en' ? "Note" : "หมายเหตุ";
    }
    if (m == 'insuranceCompany') {
      return l == 'en' ? "Insurance Company" : "บริษัทประกัน";
    }
    if (m == 'endOfProtection') {
      return l == 'en' ? "Insurance Company" : "สิ้นสุดการคุ้มครอง";
    }
  }

  static grouplifeLg(m, l) {
    if (m == 'grouplife') {
      return l == 'en' ? "Group Life" : "ประกันกลุ่มเพิ่มสวัสดิการ";
    }
    if (m == 'grouplifeDetail') {
      return l == 'en'
          ? "Group Life Detail"
          : "รายละเอียดประกันกลุ่มเพิ่มสวัสดิการ";
    }
    if (m == 'grouplifeInformation') {
      return l == 'en' ? "Group Life Detail" : "ข้อมูลรายละเอียดประกันกลุ่ม";
    }
    if (m == 'year') {
      return l == 'en' ? "Year" : "ปีบัญชี";
    }
    if (m == 'begindate') {
      return l == 'en' ? "Begin Date" : "วันเริ่มต้นประกัน";
    }
    if (m == 'enddate') {
      return l == 'en' ? "End Date" : "วันสิ้นสุดประกัน";
    }
    if (m == 'suminsured') {
      return l == 'en' ? "Sum insured" : "ทุนประกัน";
    }
    if (m == 'premium') {
      return l == 'en' ? "Premium" : "เบี้ยประกัน";
    }
    if (m == 'waitingtime') {
      return l == 'en' ? "Waiting Time" : "เวลารอคอย";
    }
    if (m == 'status') {
      return l == 'en' ? "Status" : "สถานะ";
    }
    if (m == 'userid') {
      return l == 'en' ? "User ID" : "User ID";
    }
    if (m == 'company') {
      return l == 'en' ? "Company" : "ชื่อบริษัท";
    }
  }

  static welmasterLg(m, l) {
    if (m == 'welmaster') {
      return l == 'en' ? "" : "สมาคมฌาปนกิจ";
    }
    if (m == 'welmasterDetail') {
      return l == 'en' ? "" : "รายละเอียดสมาคมฌาปนกิจ";
    }
    if (m == 'welmasterInformation') {
      return l == 'en' ? "" : "ข้อมูลรายละเอียดสมาคมฌาปนกิจ";
    }
    if (m == 'welName') {
      return l == 'en' ? "" : "ประเภท";
    }
    if (m == 'memId') {
      return l == 'en' ? "" : "ทะเบียนสมาชิก";
    }
    if (m == 'concernDescription') {
      return l == 'en' ? "" : "สัมพันธ์";
    }
    if (m == 'memberName') {
      return l == 'en' ? "" : "ชื่อ-สกุล";
    }
    if (m == 'dateApprove') {
      return l == 'en' ? "" : "วันที่สมัคร";
    }
    if (m == 'statusDescription') {
      return l == 'en' ? "" : "สถานะ";
    }
    if (m == 'remark') {
      return l == 'en' ? "" : "หมายเหตุ";
    }
  }

  static paymentBirthdayLg(m, l) {
    if (m == 'paymentBirthday') {
      return l == 'en' ? "" : "สวัสดิการวันเกิดสมาชิก";
    }
    if (m == 'paidYear') {
      return l == 'en' ? "" : "ปีที่รับ";
    }
    if (m == 'paidDate') {
      return l == 'en' ? "" : "วันที่รับ";
    }
    if (m == 'paidAmount') {
      return l == 'en' ? "" : "จำนวนเงิน";
    }
    if (m == 'paidId') {
      return l == 'en' ? "" : "User ID";
    }
  }

  static retireLg(m, l) {
    if (m == 'retire') {
      return l == 'en' ? "" : "สวัสดิการบำเหน็จสมาชิก";
    }
    if (m == 'retireDetail') {
      return l == 'en' ? "" : "รายละเอียดสวัสดิการบำเหน็จสมาชิก";
    }
    if (m == 'retireInformation') {
      return l == 'en' ? "" : "ข้อมูลรายละเอียดสวัสดิการบำเหน็จสมาชิก";
    }
    if (m == 'yearReceive') {
      return l == 'en' ? "" : "ปีที่รับเงิน";
    }
    if (m == 'retireDes') {
      return l == 'en' ? "" : "ประเภท";
    }
    if (m == 'shareStock') {
      return l == 'en' ? "" : "ทุนเรือนหุ้น";
    }
    if (m == 'buyShare') {
      return l == 'en' ? "" : "ซื้อหุ้นก่อน 5 ปี";
    }
    if (m == 'net') {
      return l == 'en' ? "" : "สุทธิ";
    }
    if (m == 'shareAmount') {
      return l == 'en' ? "" : "บำเหน็จจากมูลค่าหุ้น";
    }
    if (m == 'termAmount') {
      return l == 'en' ? "" : "บำเหน็จจากอายุสมาชิก";
    }
    if (m == 'amount') {
      return l == 'en' ? "" : "รวมจำนวนเงิน";
    }
  }

  static welfarereceiveLg(m, l) {
    if (m == 'welfarereceive') {
      return l == 'en' ? "Welfare Receive" : "สวัสดิการ สคส.";
    }
    if (m == 'welfareDesc') {
      return l == 'en' ? "Welfare Receive" : "ประเภท";
    }
    if (m == 'welfareNo') {
      return l == 'en' ? "Welfare Receive" : "เลขที่";
    }
    if (m == 'receiveName') {
      return l == 'en' ? "Welfare Receive" : "ชื่อ-สกุล";
    }
    if (m == 'receiveAmount') {
      return l == 'en' ? "Welfare Receive" : "จำนวนเงิน";
    }
    if (m == 'receiveDate') {
      return l == 'en' ? "Welfare Receive" : "วันที่รับ";
    }
  }

  static offsetLg(m, l) {
    if (m == 'detail') {
      return l == 'en' ? "loan contract no new" : "รายละเอียด";
    }
    if (m == 'principal') {
      return l == 'en' ? "Principal" : "เงินต้น";
    }
    if (m == 'interest') {
      return l == 'en' ? "Interest" : "ดอกเบี้ย";
    }
    if (m == 'receptAmount1') {
      return l == 'en' ? "recept amount" : "รวมชำระ";
    }
    if (m == 'loanContractNoNew') {
      return l == 'en' ? "loan contract no new" : "เลขที่สัญญาเงินกู้ใหม่";
    }
    if (m == 'receptAmount') {
      return l == 'en' ? "recept amount" : "รวมเงินที่ชำระ";
    }
    if (m == 'CountDetail') {
      return l == 'en' ? "CountDetail" : "จำนวนรายการ";
    }
    if (m == 'receiptDate') {
      return l == 'en' ? "Receipt Date" : "วันที่ใบเสร็จ";
    }
    if (m == 'receiptNumber') {
      return l == 'en' ? "Receipt number" : "เลขที่ใบเสร็จ";
    }
    if (m == 'offset') {
      return l == 'en' ? "offset" : "รายการหักกลบหนี้";
    }
    if (m == 'printoffset') {
      return l == 'en' ? "printoffset" : "พิมพ์รายการหักกลบหนี้";
    }

    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - สกุล";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount" : "จำนวนเงิน";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่";
    }
  }

  static settingLg(m, l) {
    if (m == 'setting') {
      return l == 'en' ? "Setting" : "ตั้งค่า";
    }
    if (m == '') {
      return l == 'en' ? "" : "";
    }
    if (m == 'about') {
      return l == 'en' ? "About" : "เกี่ยวกับ";
    }
    if (m == 'passwordSecurity') {
      return l == 'en' ? "Password Security" : "ความปลอดภัยของรหัสผ่าน";
    }
    if (m == 'language') {
      return l == 'en' ? "Language" : "ภาษา";
    }
    if (m == 'about') {
      return l == 'en' ? "About" : "เกี่ยวกับ";
    }
    if (m == 'touchAndFace') {
      return l == 'en' ? "TouchID And FaceID" : "สแกนลายนิ้วมือและใบหน้า";
    }
    if (m == 'change') {
      return l == 'en' ? "Change" : "เปลี่ยนภาษา";
    }
    if (m == 'cancel') {
      return l == 'en' ? "Cancel" : "ยกเลิก";
    }
    if (m == 'logOut') {
      return l == 'en' ? "Log Out" : "ออกจากระบบ";
    }
    if (m == 'application') {
      return l == 'en' ? "Application" : "ข้อมูลแอปพลิเคชัน";
    }
    if (m == 'version') {
      return l == 'en' ? "Version" : "เวอร์ชัน";
    }
    if (m == 'mobile') {
      return l == 'en' ? "Mobile" : "ข้อมูลมือถือ";
    }
    if (m == 'platform') {
      return l == 'en' ? "Platform" : "ระบบปฏิบัติการ";
    }
    if (m == 'model') {
      return l == 'en' ? "Model" : "ประเภท";
    }

    if (m == 'changePin') {
      return l == 'en' ? "Change Pin" : "เปลี่ยนPIN CODE";
    }
    if (m == 'forgotPassword1') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'forgotPassword') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'deactivate') {
      return l == 'en' ? "Deactivate" : "ลงชื่อออกจากระบบ";
    }
    if (m == 'forgotPassworddesc') {
      return l == 'en' ? "Change Pin" : "กรณีลืมรหัสผ่าน";
    }
    if (m == 'deactivatedesc') {
      return l == 'en' ? "Deactivate" : "ลงชื่อออกจากอุปกรณ์";
    }
    if (m == 'changePindesc') {
      return l == 'en' ? "Change Pin" : "ปรับปรุง PIN CODE";
    }
    if (m == 'changePinDetail') {
      return l == 'en'
          ? "\t\tTo change the PIN Code, you must first enter the old password. And then change to the new code you need"
          : "\t\tการเปลี่ยน PIN CODE ท่านจะต้องกรอก PIN เดิมก่อน แล้วจึงทำการตั้งPIN CODE ใหม่";
    }
    if (m == 'forgotPasswordDetail') {
      return l == 'en'
          ? "\t\tMaking this menu, the system will delete all of your PIN Code. You must finish changing the password and then set the new PIN Code of access."
          : "\t\tการทำเมนูนี้ ระบบจะทำการลบ PIN Code ออกทั้งหมด ท่านต้องทำการเปลี่ยนรหัสผ่านและตั้ง PIN Code ใหม่เพื่อเข้าใช้งานระบบ";
    }
    if (m == 'deactivateDetail') {
      return l == 'en'
          ? "\t\tTermination menu The system will delete All of your Mobile App settings If you want to use the App, you must sign in again."
          : "\t\tเมนูการลงชื่อออกจากระบบ ระบบจะทำการลบข้อมูลการตั้งค่าของ Application ทั้งหมด ถ้าต้องการเข้าใช้งาน Application ท่านจะต้องทำการเข้าสู่ระบบการใช้งานใหม่";
    }

    if (m == 'yes') {
      return l == 'en' ? "     Yes     " : "     ใช่     ";
    }
    if (m == 'no') {
      return l == 'en' ? "     No     " : "     ไม่ใช่     ";
    }
    if (m == 'youWant') {
      return l == 'en' ? "You want " : "ท่านต้องการ ";
    }
    if (m == 'yesOrNo') {
      return l == 'en' ? "Yes or No" : "หรือไม่";
    }
    if (m == 'adjustFontSize') {
      return l == 'en' ? "Adjust font size" : "ขนาดตัวอักษร";
    }
    if (m == 'small') {
      return l == 'en' ? "Small" : "เล็ก";
    }
    if (m == 'normal') {
      return l == 'en' ? "Normal" : "ปกติ";
    }
    if (m == 'large') {
      return l == 'en' ? "Large" : "ใหญ่";
    }
    if (m == 'fontsize') {
      return l == 'en' ? "Font Size" : "ขนาดตัวอักษร";
    }
    if (m == 'select') {
      return l == 'en' ? "Select" : "เลือก";
    }
    if (m == 'save') {
      return l == 'en' ? "Save" : "บันทึก";
    }
    if (m == 'selectfont') {
      return l == 'en' ? "Please select a font size" : "กรุณาเลือกขนาดตัวอักษร";
    }
  }

  static pinLg(m, l) {
    if (m == 'pinCode') {
      return l == 'en' ? "Please enter the PIN Code" : "กรุณากรอกPIN CODE";
    }
    if (m == 'pleaseTryAgain') {
      return l == 'en'
          ? "Wrong password, please try again"
          : "PIN CODE ไม่ถูกต้องกรุณาลองใหม่อีกครั้ง";
    }
    if (m == 'originalPINCode') {
      return l == 'en'
          ? "Please enter the original PIN Code"
          : "กรุณากรอกPIN CODE เดิม";
    }
    if (m == 'incorrectOriginalPINCode') {
      return l == 'en'
          ? "The original PIN Code is incorrect"
          : "PIN CODE เดิม ไม่ถูกต้อง";
    }
    if (m == 'setPassword') {
      return l == 'en' ? "Set password" : "กรุณาตั้งPIN CODE";
    }
    if (m == 'confirmPassword') {
      return l == 'en' ? "Confirm password" : "ยืนยันPIN CODE";
    }
    if (m == 'confirmPasswords') {
      return l == 'en' ? "Confirm password" : "ยืนยันรหัสผ่าน";
    }
    if (m == 'confirmPleaseTryAgain') {
      return l == 'en'
          ? "Wrong password confirmation. Please try again"
          : "ยืนยันPIN CODE ไม่ถูกต้องกรุณาลองใหม่อีกครั้ง";
    }
    if (m == 'confirmTouchIDAndFaceID') {
      return l == 'en'
          ? "Confirm activation of TouchID and FaceID"
          : "ยืนยันการเปิดใช้งาน TouchID และ FaceID";
    }
    if (m == 'incorrectconfirmTouchIDAndFaceID') {
      return l == 'en'
          ? "The password was wrong. Please try again"
          : "PIN CODE เปิดใช้งานผิดโปรดลองอีกครั้ง";
    }
    if (m == 'delete') {
      return l == 'en' ? "Delete" : "ลบ";
    }
    if (m == 'reset') {
      return l == 'en' ? "Reset" : "รีเซ็ต";
    }
    if (m == 'forgot') {
      return l == 'en' ? "Forgot" : "ลืม Pin";
    }
    if (m == 'update') {
      return l == 'en' ? "update" : "อัพเดท";
    }
    if (m == 'yes') {
      return l == 'en' ? "Yes" : "ใช่";
    }
    if (m == 'no') {
      return l == 'en' ? "No" : "ไม่";
    }
    if (m == 'fversion') {
      return l == 'en'
          ? "The application does not support."
          : "แอปพลิเคชัน ไม่สนับสนุน";
    }
    if (m == 'uversion') {
      return l == 'en' ? "Version Update" : "เวอร์ชั่นอัพเดท";
    }
    if (m == 'changedpassword') {
      return l == 'en'
          ? "The password has been changed."
          : "รหัสผ่านมีการเปลี่ยนแปลง";
    }
    if (m == 'changedpasswordlogin') {
      return l == 'en'
          ? "Your password has been changed. You must log in again."
          : "รหัสผ่านของท่านมีการเปลี่ยนแปลงท่านต้องลงชื่อเข้าสู่ระบบใหม่";
    }
    if (m == 'ok') {
      return l == 'en' ? "OK" : "ตกลง";
    }
    // if (m == 'checkapplogin') {
    //   return l == 'en'
    //       ? "Your app has not been accessed for too long. For data security You must Sign in again"
    //       : "แอพของท่าน ไม่ได้มีการเข้าใช้นานเกินกำหนด เพื่อความปลอดภัยของข้อมูล ท่านต้องทำการ ลงชื่อเข้าใช้ใหม่";
    // }
    if (m == 'checkapplogin') {
      return l == 'en'
          ? "Your app has not been accessed for too long. For data security You must Sign in again"
          : "เนื่องจากเกิดข้อผิดพลาด กรุณาลงชื่อเข้าใช้ใหม่";
    }
    if (m == 'checkapplogin1') {
      return l == 'en'
          ? "Your app has not been accessed for too long. For data security You must Sign in again"
          : "เนื่องจากไม่ได้มีการเข้าใช้งานเกิน 60 วัน กรุณาลงชื่อเข้าใช้ใหม่";
    }
  }

  static loginLg(m, l) {
    if (m == 'member') {
      return l == 'en' ? "Membership" : "ทะเบียนสมาชิก";
    }
    if (m == 'memberNumber') {
      return l == 'en' ? "Membership Number" : "เลขทะเบียนสมาชิก";
    }
    if (m == 'memberDetail') {
      return l == 'en'
          ? "Please enter your ${MyClass.lengthmember()}-digit membership registration number"
          : "กรุณากรอกเลขทะเบียนสมาชิก ให้ครบ ${MyClass.lengthmember()} หลัก";
    }
    if (m == 'password') {
      return l == 'en' ? "Password" : "รหัสผ่าน";
    }
    if (m == 'confirmPassword') {
      return l == 'en' ? "Confirm password" : "ยืนยันPIN CODE";
    }
    if (m == 'pleaseConfirmPassword') {
      return l == 'en' ? "Please confirm password" : "กรุณายืนยันรหัสผ่าน";
    }
    if (m == 'pleaseYourpassword') {
      return l == 'en' ? "Please enter your password" : "กรุณากรอกรหัสผ่าน";
    }
    if (m == 'logIn') {
      return l == 'en' ? "Log In" : "เข้าสู่ระบบ";
    }
    if (m == 'memberRegis') {
      return l == 'en' ? "Member registration" : "ลงทะเบียนเปิดใช้งาน";
    }
    if (m == 'newRegis') {
      return l == 'en' ? "New Registration" : "ลงทะเบียนใหม่";
    }
    if (m == 'forgotPassword') {
      return l == 'en' ? "Forgot password" : "ลืมรหัสผ่าน";
    }
    if (m == 'alertlogin') {
      return l == 'en'
          ? "Please check your member registration number and password or the internet"
          : "กรุณาตรวจสอบหมายเลขสมาชิกและรหัสผ่านหรืออินเทอร์เน็ต";
    }
    // checkregis
    if (m == 'checkMemberRegistration') {
      return l == 'en'
          ? "Please check the member registration number"
          : "กรุณาตรวจสอบเลขทะเบียนสมาชิก";
    }
    if (m == 'checkInformation') {
      return l == 'en' ? "Check information" : "ตรวจสอบข้อมูลสมาชิก";
    }
    if (m == 'cancel') {
      return l == 'en' ? "   Cancel   " : "   ยกเลิก   ";
    }
    // regis and forget
    if (m == 'idCardDetail') {
      return l == 'en'
          ? "Please enter your 13-digit identification number"
          : "กรุณากรอกเลขบัตรประชาชน ให้ครบ 13 หลัก";
    }
    if (m == 'birthDayDetail') {
      return l == 'en'
          ? "Please specify the date of birth in the form 01/01/2563 \n or click the Icon"
          : "กรุณาระบุวันเกิด ในรูปแบบปี พ.ศ. เช่น 01/01/2524";
    }
    if (m == 'passwordDetail') {
      return l == 'en'
          ? "Please enter a password, at least 6 digits"
          : "กรุณากรอกรหัสผ่านอย่างน้อย 6 หลัก";
    }
    if (m == 'invalidIDCard') {
      return l == 'en'
          ? "Invalid ID card number"
          : "หมายเลขบัตรประชาชนไม่ถูกต้อง";
    }

    if (m == 'invalidConPassword') {
      return l == 'en' ? "Invalid confirmation code" : "รหัสยืนยันไม่ถูกต้อง";
    }
    if (m == 'invalidBirthday') {
      return l == 'en' ? "Invalid birthday" : "วันเกิดไม่ถูกต้อง";
    }
    if (m == 'registrationFailed') {
      return l == 'en' ? "Registration failed" : "ลงทะเบียนไม่สำเร็จ";
    }
    if (m == 'regisok') {
      return l == 'en' ? "Registration" : "ลงทะเบียนสำเร็จ";
    }
    if (m == 'forgetok') {
      return l == 'en' ? "Forget" : "เปลี่ยนรหัสผ่านสำเร็จ";
    }
    if (m == 'passwordChangeUnsuccessful') {
      return l == 'en'
          ? "Password change unsuccessful"
          : "เปลี่ยนรหัสผ่านไม่สำเร็จ";
    }
    if (m == 'save') {
      return l == 'en' ? "   Save   " : "   ยืนยัน   ";
    }
    if (m == 'idCard') {
      return l == 'en' ? "ID Card" : "เลขบัตรประชาชน";
    }
    if (m == 'idCardFormat') {
      return l == 'en' ? "x-xxxx-xxxxx-xx-x" : "x-xxxx-xxxxx-xx-x";
    }
    if (m == 'birthday') {
      return l == 'en' ? "Birthday" : "วันเกิด";
    }
    if (m == 'birthdayFormat') {
      return l == 'en' ? "Birthday Format" : "xx/xx/xxxx";
    }
  }

  static tabsLg(m, l) {
    if (m == 'menu') {
      return l == 'en' ? "Menu" : "เมนู";
    }
    if (m == 'address') {
      return l == 'en' ? "Address" : "ที่อยู่สหกรณ์";
    }
    if (m == 'profile') {
      return l == 'en' ? "Profile" : "ข้อมูลส่วนตัว";
    }
    if (m == 'news') {
      return l == 'en' ? "News" : "ข่าวสาร";
    }
  }

  static newsLg(m, l) {
    if (m == 'news') {
      return l == 'en' ? "News" : "ข่าวสารสหกรณ์";
    }
    if (m == 'Coopnews') {
      return l == 'en' ? "Cooperative news" : "ข่าวประชาสัมพันธ์";
    }
    if (m == 'load') {
      return l == 'en' ? "Load" : "โหลดไฟล์";
    }
    if (m == '') {
      return l == 'en' ? "" : "";
    }
  }

  static addressLg(m, l) {
    if (m == 'address') {
      return l == 'en' ? "Address" : "ที่อยู่สหกรณ์";
    }
  }

  static mainLg(m, l) {
    if (m == 'nodata') {
      return l == 'en' ? "No item" : "ไม่มีรายการ";
    }
  }

  static msgLg(m, l) {
    if (m == 'msg') {
      return l == 'en' ? "Massage" : "ข้อความถึงท่าน";
    }
  }

  static pdpa(m, l) {
    if (m == 'pdpa') {
      return l == 'en'
          ? "Massage"
          : "การสมัครใช้บริการ\nข้อกำหนดและเงื่อนไขการใช้บริการ\n Mobile Application สำหรับสมาชิก\n${MyClass.company("th")}";
    }
    if (m == 'pdpaDtail') {
      return l == 'en'
          ? "Massage"
          : "1. Mobile Application ของ${MyClass.company("th")} (สหกรณ์) เป็นการให้บริการทางเครือข่ายอินเทอร์เน็ต ผ่านระบบและอุปกรณ์เทคโนโลยีในรูปแบบของ Application บนโทรศัพท์มือถือ เพื่ออำนวยความสะดวกให้สมาชิกของสหกรณ์ สมาชิกสามารถทำการตรวจสอบข้อมูลส่วนบุคคล ธุรกรรมทางการเงินที่มีกับสหกรณ์\n \n2. การเข้าใช้งานระบบข้อมูลสมาชิกจะต้องทำการสมัครเข้าใช้งานระบบและต้องเป็นสมาชิกของสหกรณ์ เท่านั้น\n \n3. หากชื่อหรือหมายเลขสมาชิกของท่านได้มีการสมัครใช้งานแล้ว โดยท่านไม่ทราบ หรือไม่ได้ทำการสมัครด้วยตัวท่านเองกรุณาแจ้งเจ้าหน้าที่เพื่อทำการตรวจสอบความถูกต้องต่อไป\n \n4. เพื่อความปลอดภัยในข้อมูลของท่าน หากสหกรณ์พบว่ามีบุคคลแอบอ้างใช้งานบัญชีของท่านในการเข้าสู่ระบบสหกรณ์จะบังคับบุคคลนั้นออกจากระบบ โดยไม่ต้องแจ้งให้ทราบ\n \n5. หากข้อมูลรายละเอียดของสมาชิกไม่ถูกต้องในระบบแล้วมีข้อสงสัยหรือต้องการทำการเปลี่ยนแปลงปรับปรุงข้อมูลให้สมาชิกติดต่อเจ้าหน้าที่เพื่อทำการแก้ไขปรับปรุงเปลี่ยนแปลงข้อมูลต่อไป\n \n6. ข้าพเจ้าได้อ่านข้อตกลงดังกล่าวและยินยอมในเงื่อนไขต่างๆที่ทางสหกรณ์กำหนดไว้รวมถึงที่สหกรณ์จะได้กำหนดแก้ไขเพิ่มเติมหรือเปลี่ยนแปลงในภายภาคหน้าซึ่งให้ถือเป็นส่วนหนึ่งของเงื่อนไขและข้อกำหนดนี้ด้วยการยืนยันข้อมูล";
    }
    if (m == 'pdpaDtail1') {
      return l == 'en'
          ? "Massage"
          : 'TOT CO-OP  เป็นการให้บริการของ${MyClass.company("th")} ทางเครือข่ายอินเทอร์เน็ต ผ่านระบบและอุปกรณ์เทคโนโลยีในรูปแบบของ Application บนโทรศัพท์มือถือ ซึ่งต่อไปนี้จะเรียกว่า "สอท." เพื่ออำนวยความสะดวกในการตรวจสอบข้อมูลส่วนบุคคล ธุรกรรมทางการเงินต่าง ๆ  แก่สมาชิกของ${MyClass.company("th")}  ซึ่งต่อไปนี้จะเรียกว่า "สมาชิก" ให้สามารถใช้ บริการตรวจสอบข้อมูลส่วนบุคคล และ/หรือการทำธุรกรรมทางการเงิน ใด ๆ ที่ สอท.ได้จัดให้มีขึ้นผ่าน TOT CO-OP  ทั้งที่ สอท. กำหนด ไว้แล้วในขณะนี้และ/หรือที่จะมีขึ้นต่อไปในภายหน้าทุกประการ โดยสมาชิก ตกลงยินยอมผูกพันตามข้อตกลงและเงื่อนไขการใช้บริการ TOT CO-OP ดังต่อไปนี้\n\n1.เงื่อนไขทั่วไป\n   1.1.หากชื่อหรือหมายเลขสมาชิกของสมาชิกได้มีการสมัครใช้งานแล้ว โดยท่านไม่ทราบ หรือไม่ได้ทำการสมัครด้วยตัวท่านเองกรุณาแจ้ง สอท.เพื่อทำการตรวจสอบความถูกต้องต่อไป\n   1.2.เพื่อความปลอดภัยในข้อมูลของสมาชิก หาก สอท.พบว่ามีบุคคลแอบอ้างใช้งานบัญชีของ สมาชิกในการเข้าใช้บริการ TOT CO-OP   สอท. จะบังคับบุคคลนั้นออกจากระบบ โดยไม่ต้องแจ้งให้ทราบ\n   1.3.หากข้อมูลรายละเอียดของสมาชิกไม่ถูกต้องในระบบแล้วมีข้อสงสัยหรือต้องการทำการเปลี่ยนแปลงปรับปรุงข้อมูลให้สมาชิกติดต่อเจ้าหน้าที่เพื่อทำการแก้ไขปรับปรุงเปลี่ยนแปลงข้อมูลต่อไป\n\n2.เงื่อนไขการสมัครใช้บริการ\n   2.1.สอท.เปิดให้บริการ TOT CO-OP สำหรับสมาชิก สอท.เท่านั้น\n   2.2.การสมัครใช้บริการ  TOT CO-OP ของ สอท. สมาชิกต้องใช้บัตรประชาชนและทำการยืนยันตัวตนผ่านหมายเลขโทรศัพท์เคลื่อนที่   รหัส One Time Password (0TP) \n\n3.การใช้และการเก็บรักษารหัสประจำตัว\n   3.1.ในการ Login เพื่อเข้าใช้บริการ TOT CO-OP ของ สอท. สมาชิกต้องใช้ ข้อมูลทางชีวภาพ เช่น ลายนิ้วมือ ใบหน้า และ/หรือ PIN เป็นเครื่องมือในการ Login และ/หรือ เพื่อใช้บริการต่าง ๆ\n   3.2.สมาชิกต้องรักษา PIN ไว้เป็นอย่างดี และเก็บไว้ในที่ปลอดภัยมิให้สูญหาย รวมทั้งเก็บรักษาไว้เป็นความลับเฉพาะตัวของตนเองเท่านั้น โดยไม่เปิดเผยหรือกระทำการใด ๆ ที่อาจทำให้ผู้อื่นทราบรหัสประจำตัว และ/หรือ ข้อมูลส่วนบุคคล ดังกล่าว และสมาชิกต้องไม่ทำให้รหัสประจำตัวและ/หรือข้อมูลส่วนบุคคลดังกล่าวตกอยู่ภายใต้การครอบครองของบุคคลอื่น หากเกิดความเสียหายประการใดจากการสูญหายหรือการเปิดเผยรหัสต่าง ๆ ดังกล่าว หรือจากเหตุอื่นใด  สอท.ไม่จำเป็นต้องรับผิดชอบใด ๆ ทั้งสิ้น ทั้งนี้ สมาชิกสามารถเปลี่ยนแปลงรหัสผ่านของ PIN ได้ด้วยตนเองตลอดเวลา ตามหลักเกณฑ์ เงื่อนไข และ วิธีการตามที่ธนาคารกำหนด โดยไม่ต้องแจ้งให้ สอท.ทราบ\n   3.3.ในการใช้บริการทุกครั้ง สมาชิกจะต้องใช้ข้อมูลทางชีวภาพ เช่น ลายนิ้วมือ ใบหน้า และ/หรือ PIN กรณีสมาชิกระบุข้อมูลทางชีวภาพ เช่น ลายนิ้วมือ ใบหน้า และ/หรือ PIN ไม่ถูกต้องตามที่ สอท.กำหนด สอท.จะระงับการใช้บริการ TOT CO-OP  ไว้ชั่วคราวโดยอัตโนมัติและสมาชิกจะไม่สามารถใช้รหัสผู้ใช้งานได้อีก โดยสมาชิก จะต้องปลดล็อคการใช้บริการ เพื่อยกเลิก การระงับการใช้บริการ TOT CO-OP ชั่วคราว โดยสมาชิกจะต้องปฏิบัติตามหลักเกณฑ์ เงื่อนไข และวิธีการตามที่ สอท.กำหนด\n   3.4.กรณี สมาชิกลืมรหัสผ่านสมาชิกสามารถรีเซ็ตรหัสผ่าน การใช้บริการใหม่ด้วยตัวเองผ่านการตรวจสอบผ่านระบบยืนยันตัวตน รหัส One Time Password (0TP) \n\n4.ความสมบูรณ์ของการใช้บริการ และผลผูกพันของสมาชิก\n   4.1.สมาชิกตกลงจะไม่กระทำการใด ๆ อันมีผลให้ สอท. ต้องเข้าร่วมในข้อพิพาทระหว่าง สมาชิก กับบุคคล อื่นใด ซึ่งเกี่ยวเนื่องหรือเกี่ยวข้องกับการให้บริการ TOT CO-OP ตามข้อตกลงฉบับนี้ โดยหากสมาชิกมีข้อต่อสู้ และ/หรือสิทธิเรียกร้องใด ๆ ก็จะไปดำเนินการกับบุคคลอื่นด้วยตนเอง\n   4.2.การดำเนินการใด ๆ ผ่านบริการ TOT CO-OP อาทิเช่น การตรวจสอบข้อมูลสมาชิก การโอนเงิน การเบิกใช้ การชำระเงิน และบริการหรืออื่น ๆ ทั้งที่เป็นการกระทำของสมาชิกเอง หรือเป็นการกระทำที่เกิดขึ้นโดยบุคคลอื่น ไม่ว่าโดยประการใดก็ตาม หากได้กระทำไปโดยการใช้ PIN ที่เกี่ยวข้องกับบริการนี้แล้ว สมาชิกตกลงให้ถือว่าเป็นการกระทำที่ถูกต้องสมบูรณ์ของสมาชิกซึ่งมีผลผูกพันสมาชิกเสมือนหนึ่งได้กระทำโดยสมาชิกเอง และสมาชิกยินยอมรับผิดชอบในการกระทำดังกล่าวทุกประการ รวมทั้งให้ถือว่าเป็นการ ที่สมาชิกได้ลงลายมือชื่ออิเล็กทรอนิกส์ให้ไว้แก่สอท.เพื่อเป็นหลักฐานในการดำเนินการผ่าน TOT CO-OP ในครั้งนั้น ๆ โดยถูกต้องสมบูรณ์แล้วและตกลงให้ สอท. สามารถใช้ข้อมูลการดำเนินการดังกล่าวเป็นต้นฉบับเอกสารที่ใช้เป็นพยานหลักฐานในการพิสูจน์ว่าสมาชิกได้ดำเนินการดังกล่าวเพื่อใช้ในการดำเนินการทางกฎหมายได้ทุกประการ โดยสมาชิกไม่ต้องทำหรือลงลายมือชื่อในเอกสารใด ๆ เพื่อเป็นหลักฐานในการนั้นอีก เว้นแต่สอท.จะแจ้งหรือจะมีการกำหนดไว้อย่างชัดเจน และสมาชิกตกลงว่าสอท.ไม่จำต้องรับผิดใด ๆ ในความเสียหายที่เกิดขึ้นจากการกระทำข้างต้นโดยสมาชิกยินยอมรับผิดชอบในความเสียหายที่เกิดขึ้นจากการกระทำดังกล่าวข้างต้นทุกประการ\n   4.3.สมาชิกตกลงยินยอมผูกพันและตกลงปฏิบัติตามคู่มือระเบียบและวิธีปฏิบัติของ สอท.และเอกสารใด ๆ  ที่เกี่ยวข้องกับการใช้บริการ TOT CO-OP  ซึ่ง สอท.ได้ส่งหรือประกาศ หรือแจ้งไปยังสมาชิกทั้งที่มีอยู่ ณ ขณะนี้และที่ สอท.จะได้เพิ่มเติมต่อไปนอกจากนี้ คู่มือหรือเอกสารใด ๆ เกี่ยวกับการใช้บริการ TOT CO-OP    ที่ สอท.จะส่ง หรือประกาศ หรือแจ้งเพิ่มเติมต่อไปในภายหน้า ให้ถือว่าเป็นส่วนหนึ่งของข้อตกลงฉบับนี้ด้วย รวมทั้งสมาชิกยินยอมปฏิบัติตามระเบียบและวิธีปฏิบัติของ สอท. และ/หรือข้อกำหนดตามกฎหมายที่เกี่ยวข้อง รวมทั้งจัดทำเอกสารอื่นใดให้แก่ สอท.ตามที่ สอท. และ/หรือทางราชการเป็นผู้กำหนดด้วย\n   4.4.ข้อตกลงฉบับนี้รวมถึงข้อกำหนดและเงื่อนไขการใช้บริการ และ/หรือการทำธุรกรรมทางการเงินใด ๆ ที่ สอท.ได้จัดให้มีขึ้นผ่าน TOT CO-OP  ทั้งที่ สอท.กำหนดไว้แล้วในขณะนี้และ/หรือที่จะมีขึ้นต่อไปในภายหน้าทุกประการ       ให้ถือว่าเป็นส่วนหนึ่งของใบคำขอสมัคร/ปรับปรุง/เปลี่ยนแปลงการใช้บริการ  TOT CO-OP และ/หรือคำขอใช้บริการ TOT CO-OP ของ สอท. และข้อตกลงและ/หรือข้อกำหนดและเงื่อนไขดังกล่าวข้างต้นขัดหรือแย้งกันเอง สมาชิกจะต้องปฏิบัติตามคำวินิจฉัยของ สอท. และให้ถือว่าคำวินิจฉัยของ สอท.ดังกล่าวเป็นที่สุด โดยสมาชิกตกลงจะไม่โต้แย้ง และ/หรือ เรียกร้องค่าเสียหายหรือค่าใช้จ่ายใด ๆ ทั้งสิ้นจาก สอท.\n\n5.การดำเนินการกรณีพบข้อผิดพลาด\n   5.1.ในกรณีที่สมาชิกใช้บริการหรือทำธุรกรรมประเภทต่าง ๆ ผ่าน TOT CO-OP แล้วเกิดความบกพร่องผิดพลาดไม่ว่าความบกพร่องผิดพลาดนั้น ๆ จะเกิดขึ้นด้วยเหตุผลประการใดก็ตาม สมาชิกตกลงยินยอมให้ สอท.มีอำนาจทุกประการในการแก้ไขความบกพร่องผิดพลาดให้ถูกต้องตามความเป็นจริง\n\n6.การระงับการให้บริการ\n   6.1.กรณี สอท. ตรวจสอบแล้วปรากฎว่า มีการแก้ไขหรือดัดแปลงโทรศัพท์เคลื่อนที่รวมทั้งระบบของโทรศัพท์เคลื่อนที่ของสมาชิกที่ใช้บริการ TOT CO-OP เช่น การแก้ไขหรือดัดแปลงระบบปฏิบัติการของโทรศัพท์ iPhone (iPhone Operating System:iOS) (ซึ่งเรียกว่า Jailbreaking) หรือ การแก้ไขหรือดัดแปลงระบบปฏิบัติการของโทรศัพท์ที่ใช้ Android (ซึ่งเรียกว่า Rooting) เป็นต้น สอท.มีสิทธิระงับหรือยกเลิกการให้บริการ TOT CO-OP (ไม่ว่าบางส่วนหรือทั้งหมด) ของสมาชิกทันที โดยสอท.ไม่ต้องแจ้งให้สมาชิกทราบล่วงหน้า ทั้งนี้ เพื่อความปลอดภัยในการใช้บริการของสมาชิก และสมาชิกขอสละสิทธิในการเรียกร้องค่าเสียหายใด ๆ จาก สอท.ทุกประการ\n   6.2.สอท.มีสิทธิจะไม่ให้บริการ หรือระงับ การให้บริการ (ไม่ว่าบางส่วนหรือทั้งหมด) เมื่อใดก็ได้ โดยแจ้งให้ สมาชิกทราบล่วงหน้าไม่น้อยกว่า 30 วัน เว้นแต่ กรณีที่ สอท.เห็นว่าการดำเนินการตามข้อตกลงและเงื่อนไขการใช้บริการนี้   อาจเป็นการขัดต่อกฎหมาย หรือความสงบเรียบร้อย หรือศีลธรรมอันดีของประชาชน หรือมีพฤติการณ์อันน่าเชื่อว่ามีการใช้บริการหรือการทำรายการในลักษณะ Robot หรือโดยทุจริตหรือโดยมิชอบไม่ว่าประการใด ๆ หรือมีเหตุจำเป็นอื่นใดซึ่งไม่อาจแจ้งล่วงหน้าได้\n\n7.การรับรองรูปภาพ ชื่อ สัญลักษณ์เครื่องหมายและ/หรือข้อมูลใด ๆ ของ สมาชิก ที่นำมาตั้งค่า\n   7.1.สมาชิก รับรองว่ารูปภาพ ชื่อ สัญลักษณ์ เครื่องหมายและ/หรือข้อมูลใด ๆ ของ สมาชิก ที่นำมาตั้งค่าเพื่อแสดงหรือดำเนินการใด ๆ ในการใช้บริการ TOT-CO-OP เป็นทรัพย์สินทางปัญญาของ สมาชิก และ/หรือสมาชิกมีสิทธิโดยชอบในการนำมาใช้เพื่อการดังกล่าว และหากเกิดความเสียหายใด ๆ แก่ สอท.อันเนื่องมาจากการนำรูปภาพ ชื่อ สัญลักษณ์ เครื่องหมายและ/หรือข้อมูลใด ๆ ดังกล่าวมาใช้กับการใช้บริการ TOT CO-OP ผู้ขอใช้บริการตกลงชดใช้ค่าเสียหายที่เกิดขึ้นแก่ สอท.ทั้งสิ้น\n\n8.การเก็บข้อมูลและเปิดเผยข้อมูลส่วนบุคคลการเก็บข้อมูลและเปิดเผยข้อมูลส่วนบุคคล\n   8.1.สมาชิก ตกลงและยอมรับว่า สอท. มีสิทธิส่งและ/หรือเปิดเผยข้อมูลส่วนบุคคล ข้อมูลทางการเงิน และ/หรือข้อมูลใด ๆ ของ สมาชิก ที่ได้ให้ไว้หรือมีอยู่กับ สอท. หรือที่ สอท.ได้รับหรือเข้าถึงจากแหล่งอื่นหรือข้อมูลอื่นใดตามที่หน่วยงานหรือคณะกรรมการที่มีอำนาจตามกฎหมายประกาศกำหนด ให้แก่ หน่วยงาน /องค์กร/นิติบุคคลใด ๆ ที่ สอท.เป็นคู่สัญญาหรือมีความสัมพันธ์ด้วย โดยมีวัตถุประสงค์เพื่อสนับสนุนการให้บริการของ สอท. เช่น การวิเคราะห์ข้อมูล การปรับปรุงบริการ หรือผลิตภัณฑ์ต่าง ๆ ของ สอท. การที่ สอท.จ้างหรือมอบหมายให้บุคคลอื่นดำเนินการแทน (เช่นงานเกี่ยวกับเทคโนโลยีสารสนเทศงานติดต่อสื่อสาร งานติดตามทวงถาม เป็นต้น) สมาชิก ได้อ่านและทำความเข้าใจนโยบายความเป็นส่วนตัวของ สอท.อย่างละเอียดที่  www.tot-coop.com แล้ว\n\n9.กฎหมายที่ใช้บังคับ\n   ข้อตกลงฉบับนี้ให้ใช้บังคับและอยู่ภายใต้กฎหมายไทยและให้ศาลไทยเป็นศาลที่มีเขตอำนาจในการพิจารณาข้อพิพาทที่เกิดขึ้นตามข้อตกลงฉบับนี้\n\n10.การแก้ไขข้อตกลง\n   10.1.สอท.มีสิทธิแก้ไข เปลี่ยนแปลง เพิ่มเติมข้อตกลงและเงื่อนไข ฉบับนี้และรายละเอียดใด ๆ ที่เกี่ยวข้องกับ TOT CO-OP รวมทั้ง ข้อตกลงและเงื่อนไขใด ๆ ที่เกี่ยวข้อง โดย สอท.จะปิดประกาศให้ทราบในที่เปิดเผย ณ ที่ทำการ${MyClass.company("th")} /หรือแจ้งผ่านทางเว็บไซต์ (website) ของ สอท.และ/หรือ Application TOT CO-OP  และ/หรือช่องทางอื่นตามที่ สอท.กำหนด\n\n11.ข้อตกลงทั่วไป\n   11.1ในกรณีที่มีกฎหมาย ประกาศ หรือระเบียบของทางราชการ กำหนดให้ สอท.ต้องเปิดเผยข้อมูล หรือธุรกรรมการเงินของผู้ขอใช้บริการต่อเจ้าหน้าที่หรือหน่วยงานของรัฐ เมื่อ สอท.ได้รับการร้องขอ ผู้ขอใช้บริการตกลงและยอมรับว่า สอท.มีสิทธิเปิดเผยข้อมูล และ/หรือจัดทำรายการเกี่ยวกับการทำธุรกรรมทางการเงินของสมาชิกต่อเจ้าหน้าที่หรือหน่วยงานของรัฐได้ทุกประการ\n\n12.ข้าพเจ้าได้อ่านข้อตกลงดังกล่าวและยินยอมในเงื่อนไขต่าง ๆที่ สอท.กำหนดไว้รวมถึงที่ สอท.จะได้กำหนดแก้ไขเพิ่มเติมหรือเปลี่ยนแปลงในภายหน้าซึ่งให้ถือเป็นส่วนหนึ่งของเงื่อนไขและข้อกำหนดนี้ด้วยการยืนยันข้อมูล';
    }

    if (m == 'pdpacheckbox') {
      return l == 'en'
          ? "Accept Terms and Conditions."
          : "ยอมรับเงื่อนไขและข้อกำหนด";
    }
    if (m == 'pdpacheckbox') {
      return l == 'en' ? "Accept Terms" : "ยอมรับเงื่อนไข";
    }
    if (m == 'pdpasave') {
      return l == 'en' ? "Accept" : "ยอมรับ";
    }
    if (m == 'pdpacancel') {
      return l == 'en' ? "UnAccept" : "ไม่ยอมรับ";
    }
    if (m == 'alertpdpa') {
      return l == 'en'
          ? "Please Accept the Terms and Conditions."
          : "กรุณายอมรับเงื่อนไขและข้อกำหนด";
    }
  }

  static other(m, l) {
    if (m == 'printstatement') {
      return l == 'en' ? "printstatement" : "พิมพ์ statement";
    }
    if (m == 'select') {
      return l == 'en' ? "Select" : "เลือก";
    }
    if (m == 'names') {
      return l == 'en' ? "name" : "ชื่อไม่ถูกต้อง";
    }
    if (m == 'lase_names') {
      return l == 'en' ? "lase_names" : "นามสกุลไม่ถูกต้อง";
    }
  }
}
