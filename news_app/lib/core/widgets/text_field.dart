import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styling/app_colors.dart';
import 'package:news_app/core/styling/app_fonts.dart';

class TextFields extends StatefulWidget {
  final void Function(String)? onFieldSubmitted;
  final String? title;

  const TextFields({super.key, this.title, required this.onFieldSubmitted});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 308.w,

      child: TextFormField(
        onFieldSubmitted: widget.onFieldSubmitted,

        decoration: InputDecoration(
          hintText: widget.title ?? "",
          hintStyle: AppFonts.black16w400,
          contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.greyColor, width: 1.w),
          ),
          fillColor: Color(0xFFF7F8F9),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.greyColor, width: 1.w),
          ),
        ),
      ),
    );
  }
}
