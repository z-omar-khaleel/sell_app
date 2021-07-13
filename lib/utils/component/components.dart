import 'package:flutter/material.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

pushNav(context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

pushNavAndReplace(context, Widget page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

Widget customText(String txt,
    {TextAlign textAlign = TextAlign.start,
    AlignmentGeometry alignment = Alignment.topLeft,
    Color color = textHeadline4White,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = 'Airbnb'}) {
  return Container(
    alignment: alignment,
    child: Text(
      txt,
      style: TextStyle(
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
    ),
  );
}

Widget defaultFormField(
        {required TextEditingController? controller,
        required TextInputType? type,
        void Function(String? s)? onSubmit,
        void Function(String? s)? onChange,
        void Function()? onTap,
        bool isPassword = false,
        String? Function(String? s)? validate,
        String? label,
        Widget? prefix,
        Icon? suffix,
        void Function()? suffixPressed,
        bool isClickable = true,
        double borderRadius = 12,
        double labelFontSize = 14,
        Key? key,
        Color? fillColor,
        Color? labelColor,
        String? hintText}) =>
    TextFormField(
      key: key,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        filled: fillColor == null ? false : true,
        fillColor: fillColor,
        helperText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        labelText: label,
        labelStyle: TextStyle(fontSize: labelFontSize, color: labelColor),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: suffix,
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
