import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget defaultFormField({
  TextEditingController? controller,
  Function(String text)? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String hint,
  IconData? prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
  required double width,
  required BuildContext context,
  List<TextInputFormatter>? textInputFormatter,
  TextInputType? keyboardType,
}) =>
    Container(
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15.0),
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        enabled: isClickable,
        onTap: () {},
        validator: (String? s) {
          return validate(s);
        },
        onChanged: onChange,
        inputFormatters: textInputFormatter,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.5),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hint,
          hintStyle:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15.0),
          border: const OutlineInputBorder(),
        ),
      ),
    );
