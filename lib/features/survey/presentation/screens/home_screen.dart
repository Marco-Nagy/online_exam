import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/questions/presentation/results/screens/result_view.dart';
import 'package:online_exam/features/survey/presentation/cubit/survey_cubit.dart';
import 'package:online_exam/features/survey/presentation/screens/profile_tab.dart';
import 'package:online_exam/features/survey/presentation/widgets/nav_bar_icon.dart';
import 'survey_explore_tab_.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    SubjectCubit cubit =   getIt.get<SubjectCubit>();
    return BlocProvider(
      create: (context) => cubit..getSubject(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(15),
              topEnd: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xffEDEFF3),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedItemColor: const Color(0xff878787),
              selectedItemColor: const Color(0xff02369C),
              items: [
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    imagePath: "assets/images/survey_icon.png",
                    isSelected: currentTabIndex == 0,
                  ),
                  label: 'Explor',
                ),
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    imagePath: "assets/images/result_icon.png",
                    isSelected: currentTabIndex == 1,
                  ),
                  label: 'Result',
                ),
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    imagePath: "assets/images/profile_icon.png",
                    isSelected: currentTabIndex == 2,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: currentTabIndex,
              onTap: (index) => setState(() => currentTabIndex = index),
            )),
        body: tabs[currentTabIndex],
      ),
    );
  }

  List<Widget> tabs = [
    const SurveyTab(),
    const ResultView(),
   const ProfileTab()
  ];
}
