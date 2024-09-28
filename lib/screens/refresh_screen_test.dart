import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rabuh/themes/theme.dart';
import 'package:rabuh/widgets/post_card.dart';

class RefreshScreenTest extends StatefulWidget {
  const RefreshScreenTest({super.key});

  @override
  State<RefreshScreenTest> createState() => _RefreshScreenTestState();
}

class _RefreshScreenTestState extends State<RefreshScreenTest> {
  bool showRefreshIndicator = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 900,
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            print("Refresh Trigger");
            setState(() {
              showRefreshIndicator = !showRefreshIndicator;
            });
          },
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          child: ListView(
            children: [
              (showRefreshIndicator) ? refreshIndicator() : SizedBox.shrink(),
              ...getElements(),
            ],
          ),
        ),
      ),
    );
  }


  List<Widget> getElements() {
    List<Widget> ans = [];
    for (int i = 0; i < 10; i++) {
      ans.add(PostCard());
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
}