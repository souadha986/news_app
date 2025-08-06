import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/navigation/app_routes.dart';
import 'package:news_app/core/widgets/text_field.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool showTextField = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextField
            ? TextFields(
                title: "search".tr(),
                onFieldSubmitted: (value) {
                  context.push(AppRoutes.searchresult, extra: value.tr());
                },
              )
            : const SizedBox.shrink(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: IconButton(
            onPressed: () {
              showTextField = !showTextField;
              setState(() {});
            },
            icon: Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
