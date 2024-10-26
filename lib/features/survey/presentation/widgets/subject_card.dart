import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/features/auth/presentation/forget_password/screens/forget_password.dart';
import 'package:online_exam/features/survey/domain/entities/subject.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard(this.subject);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRoutes.exams, arguments: subject.id);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 20.h),
        child: Container(
          padding: EdgeInsets.only(left: 20.w),
          height: 100.h,
          width: 395.w,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                blurStyle: BlurStyle.normal,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset.zero,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(15.r),
            // border:
            //     Border.all(color: Color.fromRGBO(0, 65, 130, 0.3), width: 2.w),
          ),
          child: Row(
            children: [
              Container(
                  width: 60.w,
                  height: 60.w,
                  child: Image.network(subject.icon)),
              SizedBox(
                width: 6.w,
              ),
              Text(
                subject.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
