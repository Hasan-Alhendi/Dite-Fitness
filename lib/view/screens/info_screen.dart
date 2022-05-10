import 'package:dite_fitness/view/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../control/controllers/info_controller.dart';
import '../../theme.dart';
import '../widget/backContainer.dart';

class InfoScreen extends GetView<InfoController> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
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
                          0.8455,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          customTextFormField(
                            labelText: "الاسم الأخير",
                            hintText: "الاسم الأخير",
                            prefixIcon: null,
                            suffixIcon: null,
                            controller: null,
                            onSaved: null,
                            validator: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            width: 150,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          customTextFormField(
                            labelText: "الاسم الأول",
                            hintText: "الاسم الأول",
                            prefixIcon: null,
                            suffixIcon: null,
                            controller: null,
                            onSaved: null,
                            validator: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            width: 150,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سم',
                            style: bodyStyle,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          customTextFormField(
                            labelText: null,
                            hintText: "70",
                            prefixIcon: null,
                            suffixIcon: null,
                            controller: null,
                            onSaved: null,
                            validator: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            width: 100,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'الطول',
                            style: bodyStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سم',
                            style: bodyStyle,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          customTextFormField(
                            labelText: null,
                            hintText: "70",
                            prefixIcon: null,
                            suffixIcon: null,
                            controller: null,
                            onSaved: null,
                            validator: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            width: 100,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'الطول',
                            style: bodyStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سم',
                            style: bodyStyle,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          customTextFormField(
                            labelText: null,
                            hintText: "70",
                            prefixIcon: null,
                            suffixIcon: null,
                            controller: null,
                            onSaved: null,
                            validator: null,
                            obscureText: false,
                            keyboardType: TextInputType.text,
                            width: 100,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'الطول',
                            style: bodyStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
