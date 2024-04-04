import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_screen_design/CONTROLLER/tab_bar_controller.dart';
import 'package:sample_screen_design/TAB_BAR/battle.dart';
import 'package:sample_screen_design/TAB_BAR/explore.dart';
import 'package:sample_screen_design/TAB_BAR/game.dart';
import 'package:sample_screen_design/TAB_BAR/popular.dart';
import 'package:sample_screen_design/WIDGETS/toggle_button_list.dart';

class DashboardView extends StatelessWidget {
  final TabBarController tabController = Get.put(TabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252527),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff282829), // Left color
                    Color(0xff3A363E), // Right color
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ToggleButtonList(
                selected: tabController.selectedId.value ?? 0,
                callback: (index) {
                  tabController.selectedId.value = index;
                },
                categories: tabController.categories,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (tabController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (tabController.selectedId.value == 0) {
                  return const Popular();
                } else if (tabController.selectedId.value == 1) {
                  return const Game();
                } else if (tabController.selectedId.value == 2) {
                  return Explore();
                } else if (tabController.selectedId.value == 3) {
                  return const Battle();
                } else
                  return Popular();
              }
            }),
          ),
        ],
      ),
    );
  }
}
