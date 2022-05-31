import 'package:finance_management_app/pages/pages.dart';
import 'package:finance_management_app/theme.dart';
import 'package:finance_management_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final pages = const [
    HomePage(),
    InfoPage(),
    WalletPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          },
        ),
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavigationBarItem(
                iconData: Icons.home, 
                index: 0, 
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected
              ),
              _NavigationBarItem(
                iconData: Icons.stacked_bar_chart, 
                index: 1,  
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: GlowingActionButton(
                  color: AppColors.secondary, 
                  icon: CupertinoIcons.add, 
                  onPressed: () {print("Hello");}
                ),
              ),
              _NavigationBarItem(
                iconData: Icons.wallet, 
                index: 2,
                isSelected: (selectedIndex == 2),  
                onTap: handleItemSelected
              ),
              _NavigationBarItem(
                iconData: Icons.person, 
                index: 3,  
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key, 
    required this.iconData,
    required this.index,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);


  final int index;
  final IconData iconData;
  final bool isSelected;
  final ValueChanged<int> onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {onTap(index);},
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                iconData, 
                size: 30,
                color: isSelected ? AppColors.secondary : null,
                ),
            )
          ],
        ),
      ),
    );
  }
}