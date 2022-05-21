import 'package:dite_fitness/view/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/info_controller.dart';
import '../../theme.dart';
import '../widget/back_container.dart';
import '../widget/custom_radio_icon.dart';
import '../widget/next_button.dart';

class InfoScreen extends GetView<InfoController> {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments);
    var mq = MediaQuery.of(context);
    var culomnSpace = 20.0;
    return Scaffold(
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: controller.infoFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'الرجاء ادخال المعلومات الشخصية التالية:',
                    textDirection: TextDirection.rtl,
                    style: headingStyle,
                  ),
                  backContainer(
                    height:
                        (mq.size.height - mq.padding.top - mq.padding.bottom) *
                            0.75,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            customTextFormField(
                              labelText: "الاسم الأخير",
                              hintText: "الاسم الأخير",
                              prefixIcon: null,
                              suffixIcon: null,
                              controller: controller.lastNameController,
                              onSaved: (value) => controller.lastName = value!,
                              validator: null,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              width: 150,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            customTextFormField(
                              labelText: "الاسم الأول",
                              hintText: "الاسم الأول",
                              prefixIcon: null,
                              suffixIcon: null,
                              controller: controller.firstNameController,
                              onSaved: (value) => controller.firstName = value!,
                              validator: null,
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              width: 150,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'سم',
                              style: bodyStyle,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            customTextFormField(
                              labelText: null,
                              hintText: "170",
                              prefixIcon: null,
                              suffixIcon: null,
                              controller: controller.heightController,
                              onSaved: null,
                              validator: null,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              width: 100,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'الطول',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'كغ',
                              style: bodyStyle,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            customTextFormField(
                              labelText: null,
                              hintText: "80",
                              prefixIcon: null,
                              suffixIcon: null,
                              controller: controller.wightController,
                              onSaved: null,
                              validator: null,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              width: 100,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'الوزن',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'سنة',
                              style: bodyStyle,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: IgnorePointer(
                                child: customTextFormField(
                                  labelText: null,
                                  hintText: '25',
                                  prefixIcon: null,
                                  suffixIcon: null,
                                  controller: controller.birthDateController,
                                  onSaved: null,
                                  validator: null,
                                  obscureText: false,
                                  keyboardType: TextInputType.datetime,
                                  width: 100,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'العمر',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => customRadioIcon(
                                  icon: Icons.man,
                                  label: 'ذكر',
                                  index: 1,
                                  color: controller.selectedIndex.value == 1
                                      ? buttonAndSelectedItem
                                      : textFormFiled,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Obx(
                                () => customRadioIcon(
                                  icon: Icons.woman,
                                  label: 'انثى',
                                  index: 2,
                                  color: controller.selectedIndex.value == 2
                                      ? buttonAndSelectedItem
                                      : textFormFiled,
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        nextButton(
                            label: "التالي",
                            onPressed: () {
                              controller.updateInfo();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate.value,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.selectedDate.value) {
      /* setState(() {
        selectedDate = picked;
      });*/
      controller.selectedDate.value = picked;
    }
  }
}
