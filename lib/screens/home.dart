import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopblocks_flutter/screens/cart.dart';
import 'package:shopblocks_flutter/screens/deals.dart';
import 'package:shopblocks_flutter/screens/profile.dart';
import 'package:shopblocks_flutter/screens/vendors.dart';
import 'package:shopblocks_flutter/screens/wallet.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        children: const [Deals(), Wallet(), Vendors(), Cart(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
          controller.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
        selectedItemColor: colors.primaryColor,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: false,
        iconSize: 28,
        showSelectedLabels: true,
        // selectedLabelStyle:
        //     GooglFonts.raleway(fontWeight: FontWeight.w800),
        selectedIconTheme: const IconThemeData(size: 35),
        backgroundColor: colors.scaffoldColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: colors.scaffoldColor,
            icon: const Icon(Ionicons.pricetag_outline),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
              backgroundColor: colors.scaffoldColor,
              icon: const Icon(Icons.star_border_sharp),
              label: 'Wallet'),
          BottomNavigationBarItem(
              backgroundColor: colors.scaffoldColor,
              icon: const Icon(Icons.tag_faces_outlined),
              label: 'Vendors'),
          BottomNavigationBarItem(
              backgroundColor: colors.scaffoldColor,
              icon: const Icon(Icons.notifications_outlined),
              label: 'Cart'),
          BottomNavigationBarItem(
              backgroundColor: colors.scaffoldColor,
              icon: const Icon(Icons.notifications_outlined),
              label: 'Profile'),
          // if (snapshot.data == admin || snapshot.data == superAdmin)
          //   BottomNavigationBarItem(
          //       backgroundColor: colors.scaffoldColor,
          //       icon: const Icon(Icons.admin_panel_settings_outlined),
          //       label: 'Admin'),
          // BottomNavigationBarItem(
          //     backgroundColor: colors.scaffoldColor,
          //     icon: const Icon(Icons.settings_outlined),
          //     label: 'Settings'),
        ],
      ),
    );
  }
}
