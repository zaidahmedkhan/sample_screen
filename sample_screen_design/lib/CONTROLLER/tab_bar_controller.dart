import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TabBarController extends GetxController {
  List<String> categories = [
    "Popular",
    "Game",
    "Explore",
    "Battle",
  ];

  RxInt selectedId = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedId.value = 0;
  }
}
