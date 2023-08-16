class LanguagePro {
  static menuPro(m, l) {
    if (m == 'pay') {
      return l == 'en' ? "Pay" : "ถอนเงินฝากสหกรณ์ชำระหนี้";
    }
    if (m == 'tranbank') {
      return l == 'en' ? "tranbank" : "ถอนเงินไปยังบัญชีธนาคาร";
    }
    if (m == 'bychare') {
      return l == 'en' ? "bychare" : "ชื้อหุ้น";
    }
    if (m == 'tran') {
      return l == 'en' ? "Tran" : "โอนเงินฝากภายในสหกรณ์";
    }
    if (m == 'drawLoan') {
      return l == 'en' ? "Draw Loan" : "เบิกเงินกู้ฉุกเฉิน";
    }
    if (m == 'withDrawBank') {
      return l == 'en' ? "With Draw Bank" : "ฝากเงินจากบัญชีธนาคาร";
    }
    if (m == 'loanpayment') {
      return l == 'en' ? "Bank Pay Loan" : "ชำระหนี้จากบัญชีธนาคาร";
    }
    if (m == 'diluteShares') {
      return l == 'en' ? "dilute Shares" : "เพิ่ม-ลด หุ้น";
    }
    if (m == 'calculate') {
      return l == 'en' ? "calculate" : "คำนวณสิทธิ์กู้";
    }
    if (m == 'saveBorrow') {
      return l == 'en' ? "saveBorrow" : "กู้สามัญใช้หุ้นค้ำประกัน";
    }
    if (m == 'trackStatus') {
      return l == 'en' ? "trackStatus" : "หนังสือ รับ-ส่ง";
    }
    if (m == 'admin') {
      return l == 'en' ? "Admin" : "เพิ่ม/ลด หุ้น,ทดสอบการคำนวณ,ติดตามเอกสาร";
    }
    if (m == 'history') {
      return l == 'en' ? "Transaction history" : "ประวัติการทำธุรกรรม";
    }
    if (m == 'welcome') {
      return l == 'en' ? "Welcome" : "ยินดีต้อนรับ";
    }
    if (m == 'moneyUsed') {
      return l == 'en' ? "Money used" : "เงินที่สามารถใช้ได้";
    }
    if (m == 'accountBalance') {
      return l == 'en' ? "Account balance" : "เงินคงเหลือในบัญชี";
    }
    if (m == 'editprofile') {
      return l == 'en' ? "editprofile" : "แก้ไขข้อมูลส่วนตัว";
    }
    if (m == 'detailStatus') {
      return l == 'en' ? "detailStatus" : "รายละเอียด";
    }
    if (m == '') {
      return l == 'en' ? "" : "";
    }
    if (m == 'balancePro') {
      return l == 'en' ? "" : "เงินคงเหลือ";
    }
    if (m == 'approvalLimitPro') {
      return l == 'en' ? "" : "วงเงินอนุมัติ";
    }
    if (m == 'moneyATM') {
      return l == 'en' ? "Money used" : "ยอดเงินที่สามารถใช้ได้";
    }
  }

  static tranPro(m, l) {
    if (m == 'ownAccount') {
      return l == 'en' ? "Own account" : "บัญชีตนเอง";
    }
    if (m == 'transferAccounts') {
      return l == 'en' ? "Transfer between accounts" : "โอนระหว่างบัญชี";
    }
    if (m == 'transferBank') {
      return l == 'en' ? "Transfer to the bank" : "โอนไปยังธนาคาร";
    }
    if (m == 'accountid') {
      return l == 'en' ? "Account ID" : "เลขที่บัญชี";
    }
    if (m == 'contractnumber') {
      return l == 'en' ? "Contract Number" : "เลขที่สัญญา";
    }
    if (m == 'accountDetail') {
      return l == 'en' ? "Select Account " : "กรุณากรอกเลขที่บัญชี";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount " : "จำนวนเงิน";
    }
    if (m == 'amountDetail') {
      return l == 'en' ? "Amount Detail " : "กรุณาใส่จำนวนเงิน";
    }
    if (m == 'creditBalance') {
      return l == 'en' ? "credit balance" : "วงเงินคงเหลือ";
    }
    if (m == 'baht') {
      return l == 'en' ? "Baht" : "บาท";
    }
    if (m == 'next') {
      return l == 'en' ? "Next" : "ถัดไป";
    }
    if (m == 'from') {
      return l == 'en' ? "From" : "โอนจาก";
    }
    if (m == 'to') {
      return l == 'en' ? "To" : "ไปยัง";
    }
    if (m == 'bank') {
      return l == 'en' ? "Bank" : "ธนาคาร";
    }
    if (m == 'bankDetail') {
      return l == 'en' ? "Select Bank" : "เลือกธนาคาร";
    }
    if (m == 'userAccount') {
      return l == 'en' ? "Select Account" : "เลือกบัญชี";
    }
    if (m == 'userLoan') {
      return l == 'en' ? "Select Account" : "เลือกสัญญา";
    }
    if (m == 'checkInformation') {
      return l == 'en' ? "Check information" : "ตรวจสอบข้อมูล";
    }
    if (m == 'approveIV') {
      return l == 'en' ? "approve IV" : "ทำรายการสำเร็จ";
    }
    if (m == 'fee') {
      return l == 'en' ? "Fee" : "ค่าธรรมเนียม";
    }
    if (m == 'fines') {
      return l == 'en' ? "Cooperative account fines" : "ค่าปรับบัญชีสหกรณ์";
    }
    if (m == 'date') {
      return l == 'en' ? "Date" : "วันที่ทำรายการ";
    }
    if (m == 'approve') {
      return l == 'en' ? "approve" : "ยืนยัน";
    }
    if (m == 'reference') {
      return l == 'en' ? "Reference number" : "หมายเลขอ้างอิง";
    }
    if (m == 'note') {
      return l == 'en' ? "Note" : "บันทึกช่วยจำ";
    }
    if (m == 'completed') {
      return l == 'en' ? "Completed" : "เสร็จสิ้น";
    }
    if (m == 'save') {
      return l == 'en' ? "Save" : "บันทึกใบเสร็จ";
    }
    if (m == 'account') {
      return l == 'en' ? "Account" : "บัญชี";
    }
    if (m == 'accountBalance') {
      return l == 'en' ? "" : "ยอดเงินคงเหลือ (บาท)";
    }
    if (m == 'draw') {
      return l == 'en' ? "draw" : "กู้จาก";
    }
    if (m == 'withDraw') {
      return l == 'en' ? "withDraw" : "ถอนจาก";
    }
    if (m == 'list') {
      return l == 'en' ? "List" : "รายการ";
    }
  }

  static payPro(m, l) {
    if (m == 'list') {
      return l == 'en' ? "List" : "รายการ";
    }
    if (m == 'payOffLoan') {
      return l == 'en' ? "Pay Off Loan" : "ชำระหนี้";
    }
    if (m == 'bychare') {
      return l == 'en' ? "Buy shares" : "ซื้อหุ้น";
    }
    if (m == 'amount') {
      return l == 'en' ? "Amount " : "จำนวนเงิน";
    }
    if (m == 'amountDetail') {
      return l == 'en' ? "Amount Detail " : "กรุณาใส่จำนวนเงิน";
    }
    if (m == 'creditBalance') {
      return l == 'en' ? "credit balance" : "วงเงินคงเหลือ";
    }
    if (m == 'baht') {
      return l == 'en' ? "Baht" : "บาท";
    }
    if (m == 'next') {
      return l == 'en' ? "Next" : "ถัดไป";
    }
    if (m == 'principalAmount') {
      return l == 'en' ? " principal amount" : "เงินต้น";
    }
    if (m == 'interestAmount') {
      return l == 'en' ? " interest Amount" : "ดอกเบี้ย";
    }
  }

  static history(m, l) {
    if (m == 'specifyTimePeriod') {
      return l == 'en' ? "Specify the time period" : "ระบุช่วงเวลา";
    }
    if (m == 'selectMonth') {
      return l == 'en' ? "Select Month" : "เลือกเดือน";
    }
    if (m == 'historyDetail') {
      return l == 'en' ? "" : "รายละเอียดการทำรายการ";
    }
  }

  static adminPro(m, l, c) {
    if (m == 'saveMonthlyShareRequest') {
      return l == 'en'
          ? "Save monthly\n share request"
          : c == 't'
              ? "บันทึกคำขอค่าหุ้นรายเดือน"
              : "บันทึกคำขอเปลี่ยนแปลงค่าหุ้นรายเดือน";
    }
    if (m == 'calculateBorrowingRights') {
      return l == 'en'
          ? "Calculate \nborrowing rights"
          : c == 't'
              ? "คำนวณสิทธิการกู้"
              : "คำนวณ\nสิทธิการกู้";
    }
    if (m == 'trackCooperativeBookStatus') {
      return l == 'en'
          ? "Track Cooperative\n Book Status"
          : c == 't'
              ? "ติดตามสถานะหนังสือสหกรณ์"
              : "ติดตามสถานะ\nหนังสือสหกรณ์";
    }
    if (m == 'monthlyStock') {
      return l == 'en' ? "Monthly stock" : "เปลี่ยนแปลงค่าหุ้นรายเดือน";
    }
    if (m == 'membership') {
      return l == 'en' ? "Membership " : "ทะเบียนสมาชิก";
    }
    if (m == 'name') {
      return l == 'en' ? "Name " : "ชื่อ";
    }
    if (m == 'unit') {
      return l == 'en' ? "Unit " : "ทุนเรือนหุ้น";
    }
    if (m == 'shareValue') {
      return l == 'en' ? "Share value " : "ส่งค่าหุ้นปัจจุบัน";
    }
    if (m == 'monthlyShareRequest') {
      return l == 'en'
          ? "Monthly share request"
          : "คำขอเปลี่ยนแปลงค่าหุ้นรายเดือน";
    }
    if (m == 'select') {
      return l == 'en' ? "Select" : "เลือก";
    }
    if (m == 'stockValues') {
      return l == 'en' ? "stock values" : "ใส่ค่าหุ้น";
    }
    if (m == 'saveShareValues') {
      return l == 'en' ? "Save share values" : "บันทึกคำขอเปลี่ยนแปลงค่าหุ้น";
    }
    if (m == 'saveShareNotSend') {
      return l == 'en' ? "Save share not send" : "บันทึกคำของดส่งค่าหุ้น";
    }
    if (m == 'noDetail') {
      return l == 'en' ? "No Detail" : "กรุณาใส่ข้อมูลให้ครบ";
    }
    if (m == 'basicInformation') {
      return l == 'en' ? "Basic information" : "ข้อมูลเบื้องต้น";
    }
    if (m == 'typeLoan') {
      return l == 'en' ? "Type loan" : "เงินกู้ประเภท";
    }
    if (m == 'dateReceiveLoan') {
      return l == 'en'
          ? "The date you wish to receive the loan."
          : "วันที่ต้องการรับเงินกู้";
    }
    if (m == 'checkMaximumLoanAmount') {
      return l == 'en'
          ? "Check the maximum loan amount"
          : "ตรวจสอบวงเงินกู้สูงสุด";
    }
    if (m == 'incomeExpense') {
      return l == 'en' ? "Income / Expense" : "รายได้ / ค่าใช้จ่าย";
    }
    if (m == 'type') {
      return l == 'en' ? "Type" : "ประเภท";
    }
    if (m == 'description') {
      return l == 'en' ? "Description" : "คำอธิบาย";
    }
    if (m == 'amount(baht)') {
      return l == 'en' ? "Amount (baht)" : "จำนวน(บาท)";
    }
    if (m == 'increaseIncome') {
      return l == 'en' ? "Increase income" : "เพิ่มรายได้";
    }
    if (m == 'increaseExpenses') {
      return l == 'en' ? "Increase expenses" : "เพิ่มรายจ่าย";
    }
    if (m == 'income') {
      return l == 'en' ? "income" : "รายได้";
    }
    if (m == 'expenses') {
      return l == 'en' ? "expenses" : "รายจ่าย";
    }
    if (m == 'remainingSalary') {
      return l == 'en' ? "Remaining salary" : "คงเหลือ";
    }
    if (m == 'totalIncome') {
      return l == 'en' ? "Total income" : "รวมรายได้";
    }
    if (m == 'totalExpenditure') {
      return l == 'en' ? "Total expenditure" : "รวมรายจ่าย";
    }
    if (m == 'save') {
      return l == 'en' ? "Save" : "บันทึก";
    }
    if (m == 'checkadddetail') {
      return l == 'en' ? "Check" : "กรุณาใส่ข้อมูลให้ครบ";
    }
    if (m == 'delete') {
      return l == 'en' ? "Delete" : "ลบ";
    }
    if (m == 'offsetOldVersion') {
      return l == 'en' ? "Offset old version" : "หักกลบฉบับเก่า";
    }

    if (m == 'ApprovalLimit') {
      return l == 'en' ? "Approval limit" : "วงเงินอนุมัติ";
    }
    if (m == 'contract') {
      return l == 'en' ? "contract" : "สัญญา";
    }
    if (m == 'Balance') {
      return l == 'en' ? "Balance" : "ยอดคงเหลือ";
    }
    if (m == 'detail') {
      return l == 'en' ? "Detail" : "รายละเอียด";
    }
    if (m == 'shareamountup') {
      return l == 'en' ? " " : "จำนวนเงินที่ใส่ต้องมากกว่ามูลค่าหุ้น";
    }
    if (m == 'shareamountdown') {
      return l == 'en' ? " " : "จำนวนเงินที่ใส่ต้องน้อยกว่ามูลค่าหุ้น";
    }
    if (m == 'savechare') {
      return l == 'en' ? " " : "บันทึกการเปลี่ยนแปลงมูลค่าหุ้นสำเร็จ";
    }
    if (m == 'entranceฺฺBook') {
      return l == 'en' ? " entrance book " : "สถานะหนังสือรับเข้า";
    }
    if (m == 'bookOut') {
      return l == 'en' ? " book out" : "สถานะหนังสือออก";
    }
    if (m == 'checkStatus') {
      return l == 'en' ? "Check Status" : "ตรวจสอบสถานะ";
    }
    if (m == 'detail') {
      return l == 'en' ? "" : "รายละเอียด";
    }
    if (m == 'status') {
      return l == 'en' ? "" : "สถานะ";
    }
    if (m == 'documentNumber') {
      return l == 'en' ? "Document number" : "เลขที่เอกสาร";
    }
    if (m == 'date') {
      return l == 'en' ? "date" : "วันที่";
    }
    if (m == 'subject') {
      return l == 'en' ? "subject" : "เรื่อง";
    }
  }

  static pinPro(m, l) {
    if (m == 'pinCode') {
      return l == 'en' ? "Please enter the PIN" : "กรุณาใส่รหัส PIN";
    }
    if (m == 'pleaseTryAgain') {
      return l == 'en'
          ? "Wrong password, please try again"
          : "รหัสผ่าน PIN โปรดลองอีกครั้ง";
    }
    if (m == 'delete') {
      return l == 'en' ? "Delete" : "ลบ";
    }
  }

  static other(m, l) {
    if (m == 'destinationAccount') {
      return l == 'en'
          ? "Please enter destination accounte"
          : "กรุณาใส่เลขบัญชีปลายทาง";
    }
    if (m == 'checkaccount') {
      return l == 'en'
          ? "Check Account"
          : "ไม่สามารถโอนเงินเลขบัญชีเดียวกันได้";
    }
    if (m == 'checkAmount100') {
      return l == 'en' ? "check Amount 100" : "จำนวนเงินขั้นต่ำ 100 บาท";
    }
    if (m == 'checkamountover') {
      return l == 'en' ? "checkamountover" : "จำนวนเงินในบัญชีไม่เพียงพอ";
    }
    if (m == 'checkAmount10') {
      return l == 'en'
          ? "Error Amount"
          : "ใส่จำนวนเงินไม่ถูกต้อง ตัวอย่างการใส่จำนวนเงิน 100 หรือ 150 ";
    }
    if (m == 'bankcheck') {
      return l == 'en' ? "bank check" : "กรุณาเลือกธนาคาร";
    }
    if (m == 'accountcheck') {
      return l == 'en' ? "account check" : "กรุณาเลือกเลขที่บัญชี";
    }
    if (m == 'linkbankaccount') {
      return l == 'en'
          ? "linkbankaccount"
          : "ไม่สามารถทำรายการนี้ได้ เนื่องจากผู้ใช้งานยังไม่ได้เชื่อมต่อบัญชีกับทางธนาคาร";
    }
    if (m == 'tryParse') {
      return l == 'en' ? "tryParse" : "รูปแบบจะต้องเป็นตัวเลขเท่านั้น";
    }
    if (m == 'note') {
      return l == 'en' ? "Note" : "หมายเหตุ";
    }
    if (m == 'upload') {
      return l == 'en' ? "Up Load" : "อัพโหลดไฟล์";
    }
    if (m == 'moreBorrow') {
      return l == 'en' ? "moreBorrow" : "อัพโหลดเอกสารเพิ่มเติม";
    }
    // if (m == 'linkbankaccountclose') {
    //   return l == 'en'
    //       ? "linkbankaccountclose"
    //       : "ยังไม่เปิดให้ทำธุรกรรม กับทางธนาคาร";
    // }
    if (m == 'linkbankaccountclose') {
      return l == 'en'
          ? "linkbankaccountclose"
          : "ไม่สามารถทำรายการนี้ได้ เนื่องจากผู้ใช้งานยังไม่ได้เชื่อมต่อบัญชีกับทางธนาคาร";
    }
    if (m == 'depositBalance') {
      return l == 'en' ? "moreBorrow" : "เงินคงเหลือ";
    }
    if (m == 'outstandingDebt') {
      return l == 'en' ? "outstandingDebt" : "หนี้คงเหลือ";
    }
    if (m == 'depositaccountclose') {
      return l == 'en'
          ? "depositaccountclose"
          : "ไม่สามารถทำรายการนี้ได้ เนื่องจากยังไม่ได้เปิดใช้บัญชีเงินฝาก กรุณาติดต่อสหกรณ์ฯ";
    }
    if (m == 'loancontractclose') {
      return l == 'en'
          ? "loancontractclose"
          : "ไม่สามารถทำรายการนี้ได้ เนื่องจากยังไม่ได้เปิดใช้งานบัญชีเงินกู้ กรุณาติดต่อสหกรณ์ฯ";
    }
    if (m == 'loancontractwarning') {
      return l == 'en'
          ? "loancontractclose"
          : "สถานะไม่สามารถทำรายการได้\nกรุณาติดต่อสหกรณ์ฯ";
    }
  }

  static otpLg(m, l) {
    if (m == 'verification') {
      return l == 'en' ? "OTP Verification" : "การยืนยันหมายเลข OTP";
    }
    if (m == 'otp') {
      return l == 'en' ? "Enter the code sent to " : "ป้อนรหัสที่ส่งไปที่ ";
    }
    if (m == 'time') {
      return l == 'en' ? "Password expires in : " : "รหัสผ่านหมดอายุในอีก : ";
    }
    if (m == 'requestOtp') {
      return l == 'en' ? "Request a new code" : "ขอรหัสใหม่";
    }
  }

  static linkbankLg(m, l) {
    if (m == 'name') {
      return l == 'en' ? "Name" : "ชื่อ - นามสกุล";
    }
    if (m == 'idcard') {
      return l == 'en' ? "ID Card" : "เลขบัตรประชาชน";
    }
    if (m == 'bank') {
      return l == 'en' ? "Bank" : "ธนาคาร";
    }
    if (m == 'bankAccNo') {
      return l == 'en' ? "Bank Account Number" : "เลขบัญชีธนาคาร";
    }
  }
}
