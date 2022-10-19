import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:kimyapar/core/constants/colors.dart';
import 'package:kimyapar/core/constants/styles/textfield.dart';
import 'package:kimyapar/product/utilities/validate/validate.dart';
import 'package:kimyapar/product/widgets/map/bottomshettPanel.dart';
import 'package:kimyapar/product/widgets/order/appbar.dart';
import 'package:kimyapar/view/add_order/model/add_order_model.dart';

import '../../product/widgets/addOrder/cancelButton.dart';
import '../../product/widgets/addOrder/continueButton.dart';

class AddOrder extends StatefulWidget {
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  int _currentStep = 0;
  final TextEditingController titleController = TextEditingController(text: "Et Sote");
  final TextEditingController detailController = TextEditingController(text: "4 tabak acılı");
  final TextEditingController adressTitleController = TextEditingController(text: "Ev Adresim");
  final TextEditingController adressController = TextEditingController(text: "Yeni Mah Mustafa Kale Sok");
  final TextEditingController apartmentController = TextEditingController(text: 13.toString());
  final TextEditingController floorController = TextEditingController(text :7.toString());
  final TextEditingController flatController = TextEditingController(text: 13.toString());
  final TextEditingController mobileController = TextEditingController();
  StepperType stepperType = StepperType.vertical;
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Sipariş Ekle"),
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(primary: AppColors.primary)),
              child: Form(
                key: _formKey,
                child: Stepper(
                    controlsBuilder: (context, _) {
                      return Row(children: <Widget>[
                        _currentStep == 0
                            ? Row(
                                children: [
                                  continueButton(continued),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  cancelButton(cancel),
                                ],
                              )
                            : _currentStep == 1
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      continueButton(continued),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      cancelButton(cancel),
                                    ],
                                  )
                                : _currentStep >= 2
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          continueButton(continued),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          cancelButton(cancel),
                                        ],
                                      )
                                    : cancelButton(cancel)
                      ]);
                    },
                    type: stepperType,
                    physics: const ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    steps: getSteps()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      order_step(),
      adress_step(),
      Step(
        title: const Text('İstenen Tarih'),
        content: Column(
          children: <Widget>[
            Form(
              key: formKeys[2],
              child: TextFormField(
                validator: Validate.passwordValidator,
                controller: mobileController,
                decoration: InputDecoration(
                    labelText: 'Tarih Seçin',
                    suffixIcon: GestureDetector(
                        onTap: () {
                          datePicker();
                        },
                        child: const Icon(Icons.date_range))),
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 2 ? StepState.editing : StepState.disabled,
      ),
      Step(
        title: const Text('Gözden Geçirin'),
        content: Column(
          children: <Widget>[
            Form(
              key: formKeys[3],
              child: TextFormField(
                validator: Validate.passwordValidator,
                controller: mobileController,
                decoration: const InputDecoration(labelText: 'Gözden Geçir'),
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 2 ? StepState.editing : StepState.disabled,
      ),
      //order_step()
    ];
  }

  adress_step() {
    return Step(
      title: const Text('Adres'),
      content: Column(
        children: <Widget>[
          const SizedBox(
            height: 5,
          ),
          Form(
              key: formKeys[1],
              child: Column(
                children: [
                  TextFormField(
                      validator: Validate.adressTitle,
                      decoration: orderBox("Başlık(Ev,İşyeri)"),
                      controller: adressTitleController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: orderBox("Adres"),
                    validator: Validate.orderDetail,
                    controller: adressController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 75,
                        child: TextFormField(
                          controller: apartmentController,
                          validator: Validate.apartment,
                          decoration: orderBox("Bina No"),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 75,
                        child: TextFormField(
                          controller: floorController,
                          validator: Validate.floor,
                          decoration: orderBox("Kat"),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 75,
                        child: TextFormField(
                          validator: Validate.flat,
                          controller: flatController,
                          decoration: orderBox("Kapı No"),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
      isActive: _currentStep >= 0,
      state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
    );
  }

  order_step() {
    return Step(
      title: const Text('Sipariş Detayı'),
      content: Column(
        children: <Widget>[
          const SizedBox(
            height: 5,
          ),
          Form(
              key: formKeys[0],
              child: Column(
                children: [
                  TextFormField(
                    decoration: orderBox(
                      "Ne yemek istiyorsunuz",
                    ),
                    controller: titleController,
                    validator: Validate.orderTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: detailController,
                    decoration: orderBox(
                      "Detay Veriniz (örn tabak,adet,malzeme)",
                    ),
                    validator: Validate.orderDetail,
                  ),
                ],
              ))
        ],
      ),
      isActive: _currentStep >= 0,
      state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (formKeys[_currentStep].currentState!.validate()) {
      final isLastStep = _currentStep == getSteps().length - 1;
      if (isLastStep) {
        print("Siparişiniz Alındı");
        orderController.addOrder(bindAddOrderModel());
        Get.offNamed("order");
      } else {
        setState(() {
          _currentStep += 1;
        });
      }
    }
  }

  AddOrderModel bindAddOrderModel() {
    var model = AddOrderModel();
    model.completed=false;
    model.desc = detailController.text;
    model.title = titleController.text;
    model.adress =
        '${adressTitleController.text} ${adressController.text} Kat:${floorController.text} Bina No:${apartmentController.text} Kapı No:${flatController.text}';
    return model;
  }

  datePicker() {
    DatePicker.showDateTimePicker(context,
        theme: const DatePickerTheme(),
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      mobileController.text = date.toString();
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.tr);
  }

  cancel() {
    _currentStep != 0 ? setState(() => _currentStep -= 1) : null;
  }
}
