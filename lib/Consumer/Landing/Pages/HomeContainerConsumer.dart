import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Consumer/Landing/Pages/Blank.dart';
import 'package:ekikrit/Consumer/Landing/Pages/Cart.dart';
import 'package:ekikrit/Consumer/Landing/Widgets/DrawerLayoutConsumer.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'package:ekikrit/Consumer/Recommendations/Pages/FormulationRecommendations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:get/get.dart';
import '../Controller/HomeNavigationController.dart';
import 'ConsumerHome.dart';

class HomeContainerConsumer extends StatefulWidget {
  final int? selectedTab;
  const HomeContainerConsumer({this.selectedTab, Key? key}) : super(key: key);

  @override
  State<HomeContainerConsumer> createState() => _HomeContainerConsumerState();
}

class _HomeContainerConsumerState extends State<HomeContainerConsumer> {

  HomeNavigationController homeNavigationController = Get.put(HomeNavigationController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // CartController cartController = Get.put(CartController());

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        textStyle: GoogleFonts.getFont(Constants.appFont,
            fontWeight: FontWeight.w600, fontSize: 12),
        activeColorPrimary: const Color(0xFF8AC43F),
        inactiveColorPrimary: Colors.grey.shade800,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.health_and_safety_outlined,
        ),
        title: ("Recommended"),
        textStyle: GoogleFonts.getFont(Constants.appFont,
            fontWeight: FontWeight.w600,
            fontSize: 12
        ),
        activeColorPrimary: const Color(0xFF8AC43F),
        inactiveColorPrimary: Colors.grey.shade800,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.medical_information_outlined,
        ),
        title: ("Formulations"),
        textStyle: GoogleFonts.getFont(Constants.appFont,
            fontWeight: FontWeight.w600, fontSize: 12),
        activeColorPrimary: const Color(0xFF8AC43F),
        inactiveColorPrimary: Colors.grey.shade800,
      ),
      PersistentBottomNavBarItem(
        icon: const Center(
          child: Stack(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
              ),
            ],
          ),
        ),
        title: ("Cart"),
        textStyle: GoogleFonts.getFont(Constants.appFont,
            fontWeight: FontWeight.w600, fontSize: 12),
        activeColorPrimary: const Color(0xFF8AC43F),
        inactiveColorPrimary: Colors.grey.shade800,
      ),
    ];
  }

  // AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if (homeNavigationController.persistentTabController.index != 0){
          homeNavigationController.persistentTabController.jumpToTab(0);
          return false;
        }else{
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          drawer: const DrawerLayoutConsumer(),
          bottomNavigationBar: Obx(() =>
              Container(
                child: BottomNavigationBar(
                  currentIndex: homeNavigationController.selectedIndex.value,
                  selectedItemColor: Constants.accentGreen,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle:
                  GoogleFonts.getFont("Lato", color: Colors.black),
                  unselectedLabelStyle: GoogleFonts.getFont("Lato"),
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      // iconFun(path:Icons.home,context: context )
                      icon: Icon(
                        CupertinoIcons.home,
                        color: homeNavigationController.selectedIndex.value == 0 ? Constants.accentGreen : Colors.grey,
                        size: 25,
                      ),
                      label: 'Home',
                      //  backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      // iconFun(path:Icons.home,context: context )
                      icon: Icon(
                        CupertinoIcons.app_badge,
                        color: homeNavigationController.selectedIndex.value == 1 ? Constants.accentGreen : Colors.grey,
                        size: 25,
                      ),
                      label: 'Recommended',
                      //  backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      // iconFun(path:Icons.home,context: context )
                      icon: Icon(
                        Icons.history,
                        color: homeNavigationController.selectedIndex.value == 2 ? Constants.accentGreen : Colors.grey,
                        size: 25,
                      ),
                      label: 'History',
                      //  backgroundColor: Colors.red,
                    ),
                    BottomNavigationBarItem(
                      // iconFun(path:Icons.home,context: context )
                      icon: Stack(
                        children: [
                          Icon(
                            CupertinoIcons.cart,
                            color: homeNavigationController.selectedIndex.value == 3 ? Constants.accentGreen : Colors.grey,
                            size: 25,
                          ),
                          // Positioned(
                          //   right: -10,
                          //   child: Container(
                          //     height: 15,
                          //     width: 15,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //       color: Colors.deepOrange,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      label: 'Cart',
                      //  backgroundColor: Colors.red,
                    ),

                  ],
                  onTap: (index) {
                    setState(() {
                      homeNavigationController.selectedIndex.value = index;
                    });
                    if (index == 1) {

                    }
                  },
                ),
              ),
          ),
          body: Obx(() =>
              IndexedStack(
                index: homeNavigationController.selectedIndex.value,
                children: <Widget>[
                  const ConsumerHome(),
                  const FormulationRecommendations(),
                  const Blank(),
                  const Cart(),
                ],
              ),
          )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.selectedTab != null) {
      homeNavigationController.persistentTabController
          .jumpToTab(widget.selectedTab!);
    }
  }
}
