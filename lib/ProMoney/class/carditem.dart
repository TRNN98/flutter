import 'package:mwasc/FollowMe/class/myclass.dart';
import 'package:mwasc/promoney/class/languagepro.dart';
import 'package:mwasc/promoney/class/myclasspro.dart';
import 'package:mwasc/promoney/class/mycolorpro.dart';
import 'package:mwasc/promoney/class/textstylepro.dart';
import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String? title;
  final String? accountDesc;
  final String? accountId;
  final double? remainingAmount;
  final double? withdrawalAmount;
  final double? fontsizeapps;
  final String? lgs;
  final double? outstandingBalance;
  final String? withdrawFlag;
  final String? type;

  const AccountItem({
    super.key,
    this.title,
    this.accountDesc,
    this.accountId,
    this.remainingAmount,
    this.withdrawalAmount,
    this.fontsizeapps,
    this.lgs,
    this.outstandingBalance,
    this.withdrawFlag,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 10),
          child: Row(
            children: [
              Image.asset('assets/imgPro/account_wallet.png', scale: 1.5),
              // Icon(
              //   Icons.account_balance_wallet,
              //   color: MyColorPro.color('w'),
              // ),
              const Text('  '),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.cardWTxt(context, -4),
                    ),
                    type == 'SAVING'
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  accountId!,
                                  textScaleFactor:
                                      MyClassPro.fontSizeApp(fontsizeapps),
                                  textAlign: TextAlign.left,
                                  style:
                                      CustomTextStylePro.cardWTxt(context, -4),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  accountDesc!,
                                  textScaleFactor:
                                      MyClassPro.fontSizeApp(fontsizeapps),
                                  textAlign: TextAlign.right,
                                  style:
                                      CustomTextStylePro.cardWTxt(context, -4),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                accountId!,
                                textScaleFactor:
                                    MyClassPro.fontSizeApp(fontsizeapps),
                                style: CustomTextStylePro.cardWTxt(context, -3),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: Divider(
            height: 20,
            thickness: 2,
            color: MyColorPro.color('w'),
          ),
        ),

        type == 'SAVING'
            ? Padding(
                padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguagePro.menuPro('moneyUsed', lgs),
                      // textAlign: TextAlign.left,
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.cardWTxt(context, -5),
                    ),
                    Text(
                      MyClass.formatNumber(withdrawalAmount.toString()),
                      // textAlign: TextAlign.right,
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.cardWTxt(context, -5),
                    ),
                  ],
                ),
              )
            : withdrawFlag == 'N'
                ? Padding(
                    padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguagePro.other('outstandingDebt', lgs),
                          // textAlign: TextAlign.left,
                          textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                          style: CustomTextStylePro.cardWTxt(context, -5),
                        ),
                        Text(
                          MyClass.formatNumber(outstandingBalance.toString()),
                          // textAlign: TextAlign.right,
                          textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                          style: CustomTextStylePro.cardWTxt(context, -5),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguagePro.menuPro('moneyATM', lgs),
                          // textAlign: TextAlign.left,
                          textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                          style: CustomTextStylePro.cardWTxt(context, -5),
                        ),
                        Text(
                          MyClass.formatNumber(withdrawalAmount.toString()),
                          // textAlign: TextAlign.right,
                          textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                          style: CustomTextStylePro.cardWTxt(context, -5),
                        ),
                      ],
                    ),
                  ),
        type == 'LOAN'
            ? Padding(
                padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguagePro.menuPro('approvalLimitPro', lgs),
                      // textAlign: TextAlign.left,
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.cardWTxt(context, -5),
                    ),
                    Text(
                      MyClass.formatNumber(remainingAmount.toString()),
                      // textAlign: TextAlign.right,
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.cardWTxt(context, -5),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LanguagePro.other('depositBalance', lgs),
                      // textAlign: TextAlign.left,
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.cardWTxt(context, -5),
                    ),
                    Text(
                      MyClass.formatNumber(remainingAmount.toString()),
                      // textAlign: TextAlign.right,
                      textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
                      style: CustomTextStylePro.cardWTxt(context, -5),
                    ),
                  ],
                ),
              ),

        // Padding(
        //   padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         LanguagePro.menuPro('moneyUsed', lgs),
        //         // textAlign: TextAlign.left,
        //         textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
        //         style: CustomTextStylePro.cardWTxt(context, -5),
        //       ),
        //       Text(
        //         MyClass.formatNumber(withdrawalAmount.toString()),
        //         // textAlign: TextAlign.right,
        //         textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
        //         style: CustomTextStylePro.cardWTxt(context, -5),
        //       ),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 1, left: 10, right: 10),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         LanguagePro.menuPro('accountBalance', lgs),
        //         // textAlign: TextAlign.left,
        //         textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
        //         style: CustomTextStylePro.cardWTxt(context, -5),
        //       ),
        //       Text(
        //         MyClass.formatNumber(remainingAmount.toString()),
        //         // textAlign: TextAlign.right,
        //         textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
        //         style: CustomTextStylePro.cardWTxt(context, -5),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class AccountBankItem extends StatelessWidget {
  final String? bankNo;
  final String? bankaccount;
  final double? fontsizeapps;

  const AccountBankItem({
    super.key,
    this.bankNo,
    this.bankaccount,
    this.fontsizeapps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('     '),
        Image.asset(MyClassPro.bankName()[0]['img'], width: 65),
        const Text('   '),
        Text(
          MyClassPro.formatKBankAccount(bankaccount.toString()),
          textScaleFactor: MyClassPro.fontSizeApp(fontsizeapps),
          style: CustomTextStylePro.cardWTxt(context, -4),
        ),
      ],
    );
  }
}
