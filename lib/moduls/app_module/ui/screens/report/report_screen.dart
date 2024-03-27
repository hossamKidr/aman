import 'package:aman_app/core/functions/app_functions.dart';
import 'package:aman_app/core/ui_manager/app_size/app_padding.dart';
import 'package:aman_app/core/ui_manager/app_size/app_size.dart';
import 'package:aman_app/moduls/app_module/ui/screens/report/widgets/report_sheet.dart';
import 'package:aman_app/moduls/app_module/ui/screens/report/widgets/report_text.dart';
import 'package:aman_app/moduls/app_module/ui/screens/report/widgets/send_report_button.dart';
import 'package:aman_app/moduls/app_module/ui/screens/report/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:screenshot/screenshot.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

var governorateNameController = TextEditingController();
var unitNameController = TextEditingController();
var employeeNameController = TextEditingController();
var presenceController = TextEditingController();
var departureController = TextEditingController();
var activationController = TextEditingController();
var deliveryController = TextEditingController();
var notDeliveryController = TextEditingController();
var carNumbersController = TextEditingController();
var numberOfMotorcycleController = TextEditingController();
var numberOfTuktuksController = TextEditingController();
var startOfSerialNumberController = TextEditingController();
var endOfSerialNumberController = TextEditingController();
var totalController = TextEditingController();
ScreenshotController screenshotController = ScreenshotController();

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(AppSize.s20),
                Row(
                  children: [
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: governorateNameController,
                        labelText: 'اسم المحافظه',
                        validator: (value) {},
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: unitNameController,
                        labelText: 'اسم الوحده',
                        validator: (value) {},
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                Gap(AppSize.s10),
                BuildTextFormField(
                  textEditingController: employeeNameController,
                  labelText: 'اسم الموظف',
                  validator: (value) {},
                  keyboardType: TextInputType.name,
                ),
                Gap(AppSize.s10),
                Row(
                  children: [
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: presenceController,
                        labelText: 'حضور',
                        validator: (value) {},
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: departureController,
                        labelText: 'انصراف',
                        validator: (value) {},
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ],
                ),
                Gap(AppSize.s10),
                Row(
                  children: [
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: activationController,
                        labelText: 'تفعيل',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: deliveryController,
                        labelText: 'تسليم',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: notDeliveryController,
                        labelText: 'لم يتم تسليم',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Gap(AppSize.s10),
                Row(
                  children: [
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: carNumbersController,
                        labelText: 'عدد السيارات',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: numberOfMotorcycleController,
                        labelText: 'عدد الدراجه الناريه',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: numberOfTuktuksController,
                        labelText: 'عدد التوكتوك',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Gap(AppSize.s10),
                Row(
                  children: [
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: startOfSerialNumberController,
                        labelText: 'بدايه السيريال',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: endOfSerialNumberController,
                        labelText: 'نهاية السيريال',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Gap(AppSize.s10),
                    Expanded(
                      child: BuildTextFormField(
                        textEditingController: totalController,
                        labelText: 'الاجمالي',
                        validator: (value) {},
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Gap(AppSize.s25),
                SendReportButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Screenshot(
                            controller: screenshotController,
                            child: Dialog(
                              child: ReportSheet(
                                onPressedScreenShot: () async {
                                  final image =
                                      await screenshotController.capture();
                                  AppFunctions.saveImage(image!);
                                  AppFunctions.saveAndShare(image);
                                },
                                texts: [
                                  ReportText(
                                    text: governorateNameController.text,
                                  ),
                                  ReportText(
                                    text: unitNameController.text,
                                  ),
                                  ReportText(
                                    text: employeeNameController.text,
                                  ),
                                  ReportText(
                                    text: presenceController.text,
                                  ),
                                  ReportText(
                                    text: departureController.text,
                                  ),
                                  ReportText(
                                    text: activationController.text,
                                  ),
                                  ReportText(
                                    text: deliveryController.text,
                                  ),
                                  ReportText(
                                    text: notDeliveryController.text,
                                  ),
                                  ReportText(
                                    text: carNumbersController.text,
                                  ),
                                  ReportText(
                                    text: numberOfMotorcycleController.text,
                                  ),
                                  ReportText(
                                    text: numberOfTuktuksController.text,
                                  ),
                                  ReportText(
                                    text: startOfSerialNumberController.text,
                                  ),
                                  ReportText(
                                    text: endOfSerialNumberController.text,
                                  ),
                                  ReportText(
                                    text: totalController.text,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
