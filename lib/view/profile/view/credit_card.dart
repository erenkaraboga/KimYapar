import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:kimyapar/product/widgets/order/appbar.dart';

import '../../../core/constants/styles/text.dart';
import '../../../core/constants/styles/textfield.dart';

void main() => runApp(CreditCard());

class CreditCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreditCardPage();
  }
}

class CreditCardPage extends State<CreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Ödeme Seçenegi"),
      resizeToAvoidBottomInset: false,
      body: Card(
        shadowColor: Colors.orange.shade200,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        color: Colors.white,
        elevation: 20,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              "Bankanız sizden kayıt için onay isteyebilir",
              style: ksmallTextStyleCredit(),
            ),
            CreditCardWidget(
              glassmorphismConfig: null,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              backgroundNetworkImage:
                  "https://hdwallpaperim.com/wp-content/uploads/2017/08/31/148324-orange-gradient.jpg",
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'Ziraat Bankası',
              labelCardHolder: "Kart Sahibi",
              width: 400,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.orange,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              customCardTypeIcons: <CustomCardTypeIcon>[
                CustomCardTypeIcon(
                  cardType: CardType.mastercard,
                  cardImage: Image.asset(
                    'assets/mastercard.png',
                    height: 48,
                    width: 48,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: Colors.orange,
                      textColor: Colors.black,
                      cardNumberDecoration: cardNumberDecoration(),
                      expiryDateDecoration: expiryDateDecoration(),
                      cvvCodeDecoration: cvvNumberDecoration(),
                      cardHolderDecoration: cardHolderDecoration(),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: const Text(
                          'Kaydet',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('valid!');
                        } else {
                          print('invalid!');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
