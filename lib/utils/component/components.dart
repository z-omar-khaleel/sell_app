import 'package:flutter/material.dart';
import 'package:sell_app/utils/themes/white_theme.dart';

pushNav(context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

pushNavAndReplace(context, Widget page) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}

pushUntil(context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page), (route) => false);
}

Widget customText(String txt,
    {TextAlign textAlign = TextAlign.start,
    AlignmentGeometry alignment = Alignment.topLeft,
    Color color = textHeadline4White,
    double fontSize = 18,
    int maxLine = 2,
    FontWeight fontWeight = FontWeight.normal,
    String fontFamily = 'Airbnb'}) {
  return Container(
    alignment: alignment,
    child: Text(
      txt,
      maxLines: 2,
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
        double focusBorderRadius = 12,
        double labelFontSize = 14,
        Color focusColor = Colors.grey,
        Key? key,
        Color? fillColor,
        Color? labelColor,
        void Function(String?)? onSaved,
        Color borderColor = Colors.grey,
        double borderRadius = 0,
        Color? writeTxtStyle,
        FocusNode? focusNode,
        void Function()? onEditingComplete,
        TextInputAction? textInputAction,
        void Function()? prefixPressed,
        String? hintText}) =>
    TextFormField(
      textInputAction: textInputAction,
      focusNode: focusNode,
      style: TextStyle(color: writeTxtStyle),
      key: key,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
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
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor),
            borderRadius: BorderRadius.circular(focusBorderRadius)),
        labelText: label,
        labelStyle: TextStyle(fontSize: labelFontSize, color: labelColor),
        prefixIcon: prefix != null
            ? InkWell(onTap: prefixPressed, child: prefix)
            : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: suffix,
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(focusBorderRadius))),
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

Widget customContainer(
    {double? width,
    EdgeInsetsGeometry? padding,
    double? height,
    Color? color,
    double borderRadius = 0,
    required Widget child}) {
  return Container(
    padding: padding,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(borderRadius)),
    width: width,
    height: height,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

clickChip(
    {required Widget label,
    Widget? avatar,
    Color? chipColor,
    OutlinedBorder? chipShape,
    EdgeInsetsGeometry? labelPadding,
    TextStyle? labelStyle,
    void Function()? onTap,
    EdgeInsetsGeometry? padding,
    double borderRadius = 10,
    Color? inkColor}) {
  return InkWell(
    child: Chip(
      padding: padding,
      label: label,
      avatar: avatar,
      backgroundColor: chipColor,
      shape: chipShape,
      labelPadding: labelPadding,
      labelStyle: labelStyle,
    ),
    onTap: onTap,
    highlightColor: inkColor,
    borderRadius: BorderRadius.circular(borderRadius),
  );
}
