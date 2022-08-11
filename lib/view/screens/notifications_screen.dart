import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../control/controllers/notifications_controller.dart';
import '../../theme.dart';
import '../widget/appbar.dart';
import '../widget/back_container.dart';
import '../widget/next_button.dart';
import '../widget/text_form_field.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var culomnSpace = 20.0;
    return Scaffold(
      appBar: customAppBar(
        title: 'ضبط الاشعارات',
      ),
      backgroundColor: solidBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: controller.notificationsFormKey,
            child: Column(
              children: [
                backContainer(
                  height:
                      (mq.size.height - mq.padding.top - mq.padding.bottom) *
                          0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "أوقات تناول الطعام",
                          style: headingStyle,
                        ),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                _selectTime(context, 1);
                                // _selectTime1(context);
                              },
                              child: IgnorePointer(
                                child: customTextFormField(
                                  labelText: null,
                                  hintText: '08:00',
                                  controller: controller.firstMealController,
                                  onSaved: null,
                                  validator: null,
                                  keyboardType: TextInputType.datetime,
                                  width: 150,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'الوجبة الأولى',
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
                            InkWell(
                              onTap: () {
                                _selectTime(context, 2);
                                // _selectTime2(context);
                              },
                              child: IgnorePointer(
                                child: customTextFormField(
                                  labelText: null,
                                  hintText: '14:00',
                                  controller: controller.secondMealController,
                                  onSaved: null,
                                  validator: null,
                                  keyboardType: TextInputType.datetime,
                                  width: 150,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'الوجبة الثانية',
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
                            InkWell(
                              onTap: () {
                                _selectTime(context, 3);
                                // _selectTime3(context);
                              },
                              child: IgnorePointer(
                                child: customTextFormField(
                                  labelText: null,
                                  hintText: '20:00',
                                  controller: controller.thirdMealController,
                                  onSaved: null,
                                  validator: null,
                                  keyboardType: TextInputType.datetime,
                                  width: 150,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'الوجبة الثالثة',
                              style: bodyStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        Text(
                          "أيام اللعب",
                          style: headingStyle,
                        ),
                        SizedBox(
                          height: culomnSpace,
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CheckboxListTile(
                                      checkColor: Colors.greenAccent,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                      value: controller.wen.value,
                                      title: const Text('الأربعاء'),
                                      onChanged: (value) {
                                        controller.wen.value = value!;
                                        if (controller.wen.value == true) {
                                          controller.dayList.add(3);
                                        } else {
                                          controller.dayList.remove(3);
                                        }
                                      },
                                    ),
                                    CheckboxListTile(
                                      checkColor: Colors.greenAccent,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                      value: controller.thu.value,
                                      title: const Text('الخميس'),
                                      onChanged: (value) {
                                        controller.thu.value = value!;
                                        if (controller.thu.value == true) {
                                          controller.dayList.add(4);
                                        } else {
                                          controller.dayList.remove(4);
                                        }
                                      },
                                    ),
                                    CheckboxListTile(
                                      checkColor: Colors.greenAccent,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                      value: controller.fri.value,
                                      title: const Text('الجمعة'),
                                      onChanged: (value) {
                                        controller.fri.value = value!;
                                        if (controller.fri.value == true) {
                                          controller.dayList.add(5);
                                        } else {
                                          controller.dayList.remove(5);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    CheckboxListTile(
                                      checkColor: Colors.greenAccent,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                      value: controller.sat.value,
                                      title: const Text('السبت'),
                                      onChanged: (value) {
                                        controller.sat.value = value!;
                                        if (controller.sat.value == true) {
                                          controller.dayList.add(6);
                                        } else {
                                          controller.dayList.remove(6);
                                        }
                                      },
                                    ),
                                    CheckboxListTile(
                                      checkColor: Colors.greenAccent,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                      value: controller.sun.value,
                                      title: const Text('الأحد'),
                                      onChanged: (value) {
                                        controller.sun.value = value!;
                                        if (controller.sun.value == true) {
                                          controller.dayList.add(7);
                                        } else {
                                          controller.dayList.remove(7);
                                        }
                                      },
                                    ),
                                    CheckboxListTile(
                                      checkColor: Colors.greenAccent,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                      value: controller.mon.value,
                                      title: const Text('الاثنين'),
                                      onChanged: (value) {
                                        controller.mon.value = value!;
                                        if (controller.mon.value == true) {
                                          controller.dayList.add(1);
                                        } else {
                                          controller.dayList.remove(1);
                                        }
                                      },
                                    ),
                                    CheckboxListTile(
                                      checkColor: Colors.greenAccent,
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      activeColor: Colors.blue,
                                      value: controller.tus.value,
                                      title: const Text('الثلاثاء'),
                                      onChanged: (value) {
                                        controller.tus.value = value!;
                                        if (controller.tus.value == true) {
                                          controller.dayList.add(2);
                                        } else {
                                          controller.dayList.remove(2);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                nextButton(
                    label: "تأكيد",
                    onPressed: () {
                      controller.dayList.length <= 5
                          ? {controller.setNotifications(), showDialogBox()}
                          : Get.snackbar(
                              'خطأ',
                              'لا يمكنك تحديد أكثر من خمسة أيام',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context, int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final hours = picked.hour.toString().padLeft(2, '0');
      final minuts = picked.minute.toString().padLeft(2, '0');
      switch (index) {
        case 1:
          controller.firstMealController.text = '$hours:$minuts';
          break;
        case 2:
          controller.secondMealController.text = '$hours:$minuts';
          break;
        case 3:
          controller.thirdMealController.text = '$hours:$minuts';
          break;
        default:
      }
    }
  }

  showDialogBox() async {
    return await Get.defaultDialog(
      backgroundColor: container,
      title: 'تم إدخال البيانات بنجاح',
      confirm: nextButton(
          label: 'تم',
          onPressed: () async {
            Get.back();
          }),
    );
  }
}
