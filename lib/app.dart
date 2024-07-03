import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:score_live/core/theme/color.dart';

class App extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const App({super.key, required this.navigationShell});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);

    selectIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.charcoalBlack,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectIndex,
        onTap: (value) => _goToBranch(value),
        showUnselectedLabels: true,
        selectedItemColor: AppColors.rose500,
        unselectedItemColor: AppColors.gray500,
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        selectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //backgroundColor: AppColors.slateGray,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  selectIndex == 0
                      ? "assets/icons/fluent_home-24-filled.svg"
                      : "assets/icons/fluent_home-24-regular.svg",
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                selectIndex == 1
                    ? "assets/icons/fluent_apps-list-24-filled.svg"
                    : "assets/icons/fluent_apps-list-24-regular.svg",
              ),
            ),
            label: "Competition",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                selectIndex == 2
                    ? "assets/icons/fluent_news-24-filled.svg"
                    : "assets/icons/fluent_news-24-regular.svg",
              ),
            ),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                selectIndex == 3
                    ? "assets/icons/mdi_account.svg"
                    : "assets/icons/mdi_account-outline.svg",
              ),
            ),
            label: "Acount",
          )
        ],
      ),
    );
  }
}
