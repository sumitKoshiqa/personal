import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:ekikrit/Consumer/Landing/Controller/HomeNavigationController.dart';
import 'package:ekikrit/Consumer/Landing/Widgets/DrawerLayoutConsumer.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsumerHome extends StatefulWidget {
  const ConsumerHome({ Key? key}) : super(key: key);

  @override
  State<ConsumerHome> createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeNavigationController homeNavigationController = Get.put(HomeNavigationController());
  TextEditingController etSearch = TextEditingController();
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getProfile();
    profileController.getOtherUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: const DrawerLayoutConsumer(),
          body: Container(
            child: Column(
              children: [

                Container(
                  height: 50,
                  width: Get.width,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSpacers.width10,

                      IconButton(
                        onPressed: (){
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),

                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            IconButton(
                              onPressed: (){},
                              icon: const Icon(CupertinoIcons.bell),
                            ),

                            IconButton(
                              onPressed: (){},
                              icon: const Icon(CupertinoIcons.person_2),
                            ),

                            CustomSpacers.width10,


                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),

                      // search box
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // search box
                          Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                              child: Container(
                                padding: const EdgeInsets.only(left: 20,),
                                decoration: BoxDecoration(
                                    color: Constants.lightGreen,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: TextField(
                                  controller: etSearch,
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {},
                                  style: TextStyle(
                                      fontSize: Constants.fontSizeText,
                                      fontWeight: FontWeight.w500),
                                  decoration: InputDecoration(
                                      filled: false,
                                      border: InputBorder.none,
                                      counterText: "",
                                      hintStyle: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w400),
                                      hintText: "Search here",
                                      fillColor: Colors.cyan,
                                      suffixIcon: IconButton(
                                        onPressed: (){},
                                        icon: const Icon(Icons.search),
                                      )
                                  ),
                                ),
                              ),
                            ),

                          ),

                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Constants.lightGreen,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Center(
                              child: Icon(Icons.filter_list, ),
                            ),
                          ),
                          const SizedBox(width: 10,)
                        ],
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      // row 1
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Row(
                          children: [

                            // grab medicine
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  homeNavigationController.persistentTabController.jumpToTab(1);
                                },
                                child: Container(
                                    height: Get.width * 0.5,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFFEF8EE),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 10.0,
                                            offset: const Offset(0,3)
                                        ),]
                                    ),
                                    child: const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Grab Your Dietary Supplements",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),
                                        ),

                                        SizedBox(height: 5,),

                                        Text(
                                          "Get it at your door step",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.0,
                                          ),
                                        ),

                                        CustomSpacers.height4,

                                        Expanded(
                                          child: Image(
                                            image: AssetImage('assets/home-screen/supplements.png'),
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ),
                            ),

                            const SizedBox(width: 10,),

                            // perform yoga
                            Expanded(
                              child: Container(
                                  height: Get.width * 0.5,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEFF5E0),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10.0,
                                          offset: const Offset(0,3)
                                      ),]
                                  ),
                                  child: const Stack(
                                    children: [


                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Perform Yoga and Meditation",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Text(
                                            "Perform Yoga and Earn Points",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.0,
                                            ),
                                          ),

                                          CustomSpacers.height4,

                                          Expanded(
                                            child: Image(
                                              image: AssetImage('assets/home-screen/yoga.png'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      // row 2
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Row(
                          children: [

                            // diet
                            Expanded(
                              child: Container(
                                  height: Get.width * 0.5,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEFF5E0),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10.0,
                                          offset: const Offset(0,3)
                                      ),]
                                  ),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Diet",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                      ),

                                      SizedBox(height: 5,),

                                      Text(
                                        "Get the specific meal plans customized for your unique needs",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                        ),
                                      ),

                                      CustomSpacers.height4,

                                      Expanded(
                                        child: Image(
                                          image: AssetImage('assets/home-screen/diet.png'),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),

                            const SizedBox(width: 10,),

                            // perform sleep
                            Expanded(
                              child: Container(
                                  height: Get.width * 0.5,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFEF8EE),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10.0,
                                          offset: const Offset(0,3)
                                      ),]
                                  ),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Perform Sleep",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.0,
                                        ),
                                      ),

                                      SizedBox(height: 5,),

                                      Text(
                                        "Perform Sleep Meditation and Earn Points",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.0,
                                        ),
                                      ),

                                      CustomSpacers.height4,

                                      Expanded(
                                        child: Image(
                                          image: AssetImage('assets/home-screen/sleep.png'),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),

                          ],
                        ),
                      ),


                      const SizedBox(
                        height: 20,
                      ),

                      // row 3
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Row(
                          children: [

                            // journal Entry
                            Expanded(
                              child: Container(
                                  height: Get.width * 0.5,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFEF8EE),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10.0,
                                          offset: const Offset(0,3)
                                      ),]
                                  ),
                                  child: const Stack(
                                    children: [


                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Journal Entry",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Text(
                                            "Share your results and earn points",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.0,
                                            ),
                                          ),

                                          CustomSpacers.height4,

                                          Expanded(
                                            child: Image(
                                              image: AssetImage('assets/home-screen/journal.png'),
                                            ),
                                          )


                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),

                            const SizedBox(width: 10,),


                            // wellness goals
                            Expanded(
                              child: Container(
                                  height: Get.width * 0.5,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEFF5E0),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 10.0,
                                          offset: const Offset(0,3)
                                      ),]
                                  ),
                                  child: const Stack(
                                    children: [


                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Wellness Goals",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),

                                          SizedBox(height: 5,),

                                          Text(
                                            "Understand your wellness needs and therapies",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.0,
                                            ),
                                          ),

                                          CustomSpacers.height4,

                                          Expanded(
                                            child: Image(
                                              image: AssetImage('assets/home-screen/wellness.png'),
                                            ),
                                          )

                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),




                          ],
                        ),
                      ),


                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
