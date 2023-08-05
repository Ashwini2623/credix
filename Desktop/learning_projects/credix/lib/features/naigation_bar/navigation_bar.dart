// ignore_for_file: must_be_immutable, unnecessary_this

import 'package:credix/features/home_page/home_page.dart';
import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NavigationBarPage extends HookWidget {
  const NavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);
    final tabs = [
      const Center(
        child: HomePage(),
      ),
      const Center(
        child: HomePage(),
      ),
      const Center(
        child: HomePage(),
      ),
      const Center(
        child: HomePage(),
      ),
      const Center(
        child: HomePage(),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        body: tabs[currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBlueColor,
          selectedItemColor: kWhiteColor,
          unselectedItemColor: kWhiteColor,
          selectedLabelStyle: const TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 10,
              letterSpacing: 0.5),
          unselectedLabelStyle: const TextStyle(
              color: kWhiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 10,
              letterSpacing: 0.5),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.percent_sharp), label: "Offers"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.currency_rupee), label: "Account"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          ],
          onTap: (index) => currentIndex.value = index,
        ),
      ),
    );
  }
}
