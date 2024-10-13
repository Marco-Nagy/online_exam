import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';

class VerificationCode extends StatelessWidget {
  VerificationCode({super.key});

  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
  TextEditingController pin6 = TextEditingController();
String fullCode ='';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [ FilteringTextInputFormatter.digitsOnly],
   

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              // onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: pin1,
              hintText: '',
              labelText: '',
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [ FilteringTextInputFormatter.digitsOnly],

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              // onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: pin2,
              hintText: '',
              labelText: '',
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [ FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              // onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: pin3,
              hintText: '',
              labelText: '',
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [ FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              // onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: pin4,
              hintText: '',
              labelText: '',
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [ FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              // onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: pin5,
              hintText: '',
              labelText: '',
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [ FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              // onSaved: (pin1) {},
              onChanged: (value) {
                if (value.length == 1) {
                  fullCode = pin1.text+pin2.text+pin3.text+pin4.text+pin5.text+pin6.text;
                  print('full Code ==>> $fullCode');
                }
              },
              controller: pin6,
              hintText: '',
              labelText: '',
            ),
          ),
        ),
      ],
    );
  }
}
