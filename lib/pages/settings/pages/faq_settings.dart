import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:kazpost/pages/settings/pages/faq_views/first_view.dart';

class FaqSettings extends StatefulWidget {
  FaqSettings({Key key}) : super(key: key);

  @override
  _FaqSettingsState createState() => _FaqSettingsState();
}

class _FaqSettingsState extends State<FaqSettings>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Поддержка",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: new TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 35,
            indicatorColor: Color(0xFF0157A5),
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: <Widget>[
            Tab(text: "Управление"),
            Tab(text: "Приватность"),
            Tab(text: "Взаимодействие"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          FirstView(),
          Icon(Icons.enhanced_encryption),
          Icon(Icons.equalizer),
        ],
      ),
    );
  }
}
