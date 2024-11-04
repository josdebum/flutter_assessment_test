import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_assessment/app/widgets/map_dialog.dart';
import 'package:flutter_assessment/core/constants/app_colors.dart';
import 'package:flutter_assessment/core/themes/app_style.dart';
import 'package:flutter_assessment/core/utils/extensions.dart';
import 'package:flutter_assessment/core/utils/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapHomeView extends StatefulWidget {
  const MapHomeView({super.key, this.darkMapStyle});

  final String? darkMapStyle;

  @override
  State<MapHomeView> createState() => _MapHomeViewState();
}

class _MapHomeViewState extends State<MapHomeView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  bool isExpanded = true;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      reverseDuration: const Duration(milliseconds: 1000),
    )..addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _setExpanded(false);
      } else {
        _setExpanded(true);
      }
    });

    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        isVisible = true; // Show the widget after the delay
      });
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _setExpanded(bool isExpanded) {
    setState(() {
      isExpanded = isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Stack(
          fit: StackFit.expand,
          children: [
            _buildMapBackground(),
            _buildFloatingActionButton(),
            _buildMapDialog(),
            _buildSearchBar(context),
            _buildAnimatedBubbleList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMapBackground() {
    return Image.asset(
      'assets/pngs/map.png',
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.black.withOpacity(0.5),
      // Adjust opacity to control darkness
      colorBlendMode: BlendMode.darken,
    );
  }

  Widget _buildFloatingActionButton() {
    return Positioned(
      bottom: 112.h,
      right: 20.w,
      child: Card(
        elevation: 0,
        shape: const StadiumBorder(),
        color: AppColors.white2,
        child: Row(
          children: [
            const Icon(Icons.sort_rounded, color: AppColors.white, size: 18),
            Text(
              'List of variants',
              style: AppStyle.small.copyWith(
                color: AppColors.white,
              ),
            ),
          ].rowInPadding(5),
        ).paddingAll(15),
      ).scale(animationDuration: 1400.ms, delay: 200.ms),
    );
  }

  Widget _buildMapDialog() {
    return Positioned(
      left: 30.w,
      bottom: 112.h,
      child: MapDialog(animationController: _animationController),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Positioned(
      top: context.sizeHeight(0.06),
      left: 30.w,
      height: 80.h,
      width: context.sizeWidth(0.9),
      child: Row(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: TextFormField(
                controller: TextEditingController(text: 'Saint Petersburg'),
                style: AppStyle.small.copyWith(
                  color: AppColors.black2,
                ),
                decoration: InputDecoration(
                  fillColor: AppColors.white,
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 6, 12),
                    child: SvgPicture.asset(
                      "assets/svgs/search2.svg",
                      colorFilter: const ColorFilter.mode(
                          AppColors.black, BlendMode.srcIn),
                      width: 6,
                      height: 6,
                    ),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ).scale(animationDuration: 1200.ms, delay: 200.ms),
            ),
          ),
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.white,
            child: SvgPicture.asset(
              "assets/svgs/settings.svg",
              height: 18,
            ),
          ).scale(animationDuration: 1210.ms, delay: 200.ms),
        ].rowInPadding(10),
      ),
    );
  }

  Widget _buildAnimatedBubbleList(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: List.generate(6, (index) {
          final size = MediaQuery.of(context).size;
          return Positioned(
            top:
            size.height * [0.220, 0.295, 0.520, 0.324, 0.490, 0.630][index],
            left:
            size.width * [0.250, 0.300, 0.130, 0.650, 0.700, 0.580][index],
            child: isVisible
                ? _buildAnimatedBubble(index)
                : const SizedBox.shrink(),
          );
        }),
      ).paddingLeft(24),
    );
  }

  Widget _buildAnimatedBubble(int index) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double width = 40 + (40 * _animationController.value); // From 35 to 75
        double horizontalPadding =
            8 + (4 * _animationController.value); // From 8 to 12

        return Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: width,
            height: 48.h,
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 10.w,
            ),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: _animationController.isCompleted
                  ? AutoSizeText(
                [
                  '10,3 mn ₽',
                  '11 mn ₽',
                  '13,3 mn ₽',
                  '7,8 mn ₽',
                  '8,5 mn ₽',
                  '6,95 mn ₽'
                ][index],
                style: AppStyle.small.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.white,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              )
                  : (_animationController.isDismissed
                  ? const Icon(Icons.apartment,
                  color: Colors.white, size: 18)
                  : const SizedBox.shrink()),
            ),
          ),
        );
      },
    );
  }
}
