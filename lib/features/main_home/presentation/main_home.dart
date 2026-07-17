import 'package:flutter/material.dart';
import 'package:localservice/core/constants/app_assets.dart';
import 'package:localservice/core/styles/app_colors.dart';
import 'package:localservice/core/styles/text_styles.dart';
import 'package:localservice/core/widgets/svg_pic.dart';
import 'package:localservice/features/home/presentation/page/home.dart';
import 'package:localservice/features/provider_dashboard/presentation/page/provider_dashboard_page.dart';
import 'package:localservice/features/payment/presentation/page/payment_page.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    const Home(),
    const ProviderDashboardPage(),
    const PaymentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('FixIt Local', style: TextStyles.title),
        actions: [
          IconButton(
            icon: SvgPic(assetName: AppAssets.notification),
            onPressed: () {},
          ),
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: AppColors.indicatorColor,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestination(
            icon: SvgPic(
              assetName: AppAssets.home,
              color: AppColors.iconColor,
            ),
            selectedIcon: SvgPic(
              assetName: AppAssets.home,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPic(
              assetName: AppAssets.book,
              color: AppColors.iconColor,
            ),
            selectedIcon: SvgPic(
              assetName: AppAssets.book,
              color: AppColors.primaryColor,
            ),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: SvgPic(
              assetName: AppAssets.profile,
              color: AppColors.iconColor,
            ),
            selectedIcon: SvgPic(
              assetName: AppAssets.profile,
              color: AppColors.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}