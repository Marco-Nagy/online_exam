import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart'; // Your custom colors
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart'; // Your custom text form field

class VerificationCode extends HookWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    // Use flutter_hooks to create TextEditingControllers
    final pinControllers = List.generate(6, (_) => useTextEditingController());

    String fullCode = '';

    // Method to concatenate the code
    void updateFullCode() {
      fullCode = pinControllers.map((controller) => controller.text).join();
      print('full Code ==>> $fullCode');
    }
    handleOnChange(value,index){
      // Move focus forward when the current field is filled
      if (value.length == 1 && index < 5) {
        FocusScope.of(context).nextFocus();
      }

      // Move focus backward when deleting a character
      if (value.isEmpty && index > 0) {
        FocusScope.of(context).previousFocus();
        pinControllers[index].clear();
        updateFullCode();
        debugPrint('full Code(-) ==>> $fullCode');
      }

      // Update the full code when the last field is filled
      if (index == 5) {
        updateFullCode();
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: AppTextFormField(
              maxLength: 1,
              autofocus: index == 0, // Autofocus only on the first field
              keyboardType: TextInputType.number,
              width: 50,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ''; // Provide your validation message
                }
                return null;
              },
              onChanged: (value) {
                handleOnChange(value,index);
              },
              controller: pinControllers[index],
              hintText: '',
              labelText: '',
            ),
          ),
        );
      }),
    );
  }
}
