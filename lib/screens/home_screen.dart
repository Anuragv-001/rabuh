import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rabuh/screens/camera_screen.dart';
import 'package:rabuh/screens/inbox_screen.dart';
import 'package:rabuh/screens/post_screen.dart';
import 'package:rabuh/screens/profile_screen.dart';
import 'package:rabuh/screens/story_screen.dart';

import '../constants.dart';
import '../themes/theme.dart';
import '../widgets/headings.dart';
import '../widgets/margins.dart';
import 'create_post_screen.dart';
import 'explore_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  static late final TabController _tabController;
  int currentScreen = 0, currentTab = 1;
  bool showRefreshIndicator = false;

  @override
  void initState() {
    super.initState();

    _tabController =
        TabController(length: 3, vsync: this, initialIndex: currentTab);
    _tabController.addListener(() {
      setState(() {
        currentTab = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: (currentScreen == 0) ? null : NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          CameraScreen(_tabController),
          homeScreenMainContent(),
          InboxScreen(_tabController),
        ],
      ),
    );
  }

  Widget getScreen() {
    Widget ans = SizedBox.shrink();

    switch (currentScreen) {
      case 0:
        ans = RefreshIndicator.adaptive(
          onRefresh: () async {
            setState(() {
              showRefreshIndicator = !showRefreshIndicator;
            });
          },
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: SingleChildScrollView(
            child: Column(
              children: [
                (showRefreshIndicator) ? refreshIndicator() : SizedBox.shrink(),
                StoryScreen(_tabController),
                height(5),
                PostScreen(),
              ],
            ),
          ),
        );
        break;
      case 1:
        ans = ExploreScreen();
        break;
      case 2:
        _tabController.animateTo(0);
        currentScreen = 0;
        break;
      case 3:
        ans = ProfileScreen();
        break;
    }

    return ans;
  }

  Widget refreshIndicator() {
    Widget ans = Container(
      padding: EdgeInsets.only(top: 40),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SpinKitDoubleBounce(
          color: AppTheme.lightTheme.colorScheme.primary,
        ),
      ),
    );

    return ans;
  }

  Widget homeScreenMainContent() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: (currentScreen > 0)
            ? null
            : AppBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Heading1(appTitle),
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () async {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationScreen()));
                              },
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Icon(
                                Icons.circle,
                                color: Colors.red,
                                size: 10,
                              ),
                            ),
                          ],
                        ),
                        width(10),
                        InkWell(
                          onTap: () {
                            _tabController.animateTo(
                              2,
                            );
                          },
                          child: Icon(
                            FontAwesomeIcons.facebookMessenger,
                            color: Colors.black,
                          ),
                        ),
                        width(5),
                      ],
                    ),
                  ],
                ),
                elevation: 0,
                scrolledUnderElevation: 1,
              ),
        body: getScreen(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.grey, width: 0.3))),
          child: GNav(
            rippleColor: AppTheme.lightTheme.colorScheme.primary,
            gap: 8,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
            activeColor: AppTheme.lightTheme.colorScheme.primary,
            onTabChange: (screen) {
              print(screen);
              setState(() {
                currentScreen = screen;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.search_outlined,
                text: "Search",
              ),
              GButton(
                icon: Icons.add_box_outlined,
                text: "Post",
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
