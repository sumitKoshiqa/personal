import 'package:get/state_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeNavigationController extends GetxController with StateMixin{

  final PersistentTabController persistentTabController = PersistentTabController(initialIndex: 0);
  // RxInt currentPageIndex = 0.obs;
  RxInt selectedIndex = 0.obs;

}