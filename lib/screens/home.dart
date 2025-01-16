import 'package:demo_dfgc_mobile_app/screens/dapp_list.dart';
import 'package:demo_dfgc_mobile_app/screens/governance.dart';
import 'package:demo_dfgc_mobile_app/screens/token_list.dart';
import 'package:demo_dfgc_mobile_app/widgets/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/web_link.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // スクリーンのリスト
  final List<Widget> _screens = [
    TokenListScreen(),
    DappListScreen(),
    GovernanceScreen()
  ];

  // 下部メニューのアイテム
  final List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.gem),
      label: 'Tokens',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.apps),
      label: 'DApps',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(FontAwesomeIcons.networkWired),
      label: 'DAO',
    ),
  ];

  // メニューアイテムがタップされたときの処理
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SubHomeScreen(),
          _screens[_selectedIndex],
        ],
      ), // 選択されたスクリーンを表示
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _bottomNavItems,
      ),
    );
  }
}

class SubHomeScreen extends StatelessWidget {
  const SubHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          WelcomeScreen(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WebLinkWidget(
                  icon: FaIcon(FontAwesomeIcons.house, size: 25,),
                  text: '',
                  uri: Uri.parse('https://defigeek.xyz/')
              ),
              WebLinkWidget(
                  icon: FaIcon(FontAwesomeIcons.discord, size: 25,),
                  text: '',
                  uri: Uri.parse('https://discord.gg/FQYXqVBEnh')
              ),
              WebLinkWidget(icon: FaIcon(FontAwesomeIcons.xTwitter, size: 25,),
                  text: '',
                  uri: Uri.parse('https://twitter.com/DeFiGeekJapan')
              ),
              WebLinkWidget(
                  icon: FaIcon(FontAwesomeIcons.xTwitter, size: 25,),
                  text: '',
                  uri: Uri.parse('https://twitter.com/DeFiGeekJapanEn')
              ),
              WebLinkWidget(
                  icon: FaIcon(FontAwesomeIcons.github, size: 25,),
                  text: '',
                  uri: Uri.parse('https://github.com/DeFiGeek-Community')
              ),
            ],
          )
        ],
      ),
    );
  }
}
