import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/home/home_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends BaseState<MainScreen> {
  final PageController _pageController = PageController();
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        body: PageView(
          allowImplicitScrolling: true,
          controller: _pageController,
          onPageChanged: (index) {
            _changeIndexProvider.changeIndex(index);
          },
          children: <Widget>[
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
            HomeScreen(),
          ],
        ),
        bottomNavigationBar: Consumer<ChangeIndexProvider>(
          builder:
              (BuildContext context, ChangeIndexProvider value, Widget child) {
            return BottomNavigationBar(
                selectedItemColor: ColorUtil.primaryColor,
                unselectedItemColor: ColorUtil.textColor,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: value.index,
                onTap: (index) {
                  _changeIndexProvider.changeIndex(index);
                  _pageController.animateToPage(index,
                      duration: Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home),
                      title: Text(S.of(context).shopping)),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home),
                      title: Text(S.of(context).home)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_circle_outline),
                      title: Text(S.of(context).cart)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_none),
                      title: Text(S.of(context).order)),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.supervised_user_circle),
                      title: Text(S.of(context).account))
                ]);
          },
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeIndexProvider)];
  }
}
