import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_assessment/app/widgets/custom_nav_item.dart';
import 'package:flutter_assessment/core/constants/app_colors.dart';
import 'package:flutter_assessment/core/utils/extensions.dart';
import 'package:flutter_assessment/core/utils/size_config.dart';
import 'package:flutter_assessment/features/home/home_screen.dart';
import 'package:flutter_assessment/features/search/map_screen.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  NavEnum _selectedItem = NavEnum.homeTab;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _animationController.forward();
  }

  void _setupAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildScreenContent(NavEnum selectedTab) {
    switch (selectedTab) {
      case NavEnum.homeTab:
        return const HomeScreen();
      case NavEnum.searchTab:
        return const MapHomeView();
      default:
        return Container();
    }
  }

  Widget _buildBottomNavigationBar() {
    return SlideInUp(
      preferences: const AnimationPreferences(
        magnitude: 0.5,
        offset: Duration(milliseconds: 1500),
        duration: Duration(milliseconds: 4500),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 68.w, vertical: 32.h),
        padding:  EdgeInsets.symmetric(vertical: 0, horizontal: 8.w),
        height: 62.h,
        decoration: const BoxDecoration(
          color: AppColors.tertiary2,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: NavEnum.values.map((item) {
            return SizedBox(
              width: 46.w,
              height: 46.h,
              child: CustomNavItem(
                icon: item.icon,
                isActive: item == _selectedItem,
                onTap: () => setState(() => _selectedItem = item),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      extendBody: true,
      body: _buildScreenContent(_selectedItem),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}

extension NavEnumX on NavEnum {
  bool get searchTab => this == NavEnum.searchTab;

  bool get messagingTab => this == NavEnum.messagingTab;

  bool get homeTab => this == NavEnum.homeTab;

  bool get favoriteTab => this == NavEnum.favoriteTab;

  bool get userTab => this == NavEnum.userTab;
}

enum NavEnum {
  searchTab('search'),
  messagingTab('messaging'),
  homeTab('home'),
  favoriteTab('favourite'),
  userTab('user');

  final String icon;

  const NavEnum(this.icon);
}
