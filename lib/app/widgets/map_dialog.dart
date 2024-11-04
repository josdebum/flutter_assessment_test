// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_assessment/app/widgets/bottom_nav_bar_painter.dart';
import 'package:flutter_assessment/core/constants/app_colors.dart';
import 'package:flutter_assessment/core/themes/app_style.dart';
import 'package:flutter_assessment/core/utils/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapDialog extends StatefulWidget {
  const MapDialog({super.key, required this.animationController});

  final AnimationController animationController;

  @override
  State<MapDialog> createState() => _MapDialogState();
}

class _MapDialogState extends State<MapDialog> with TickerProviderStateMixin {
  final OverlayPortalController _overlayPortalController =
      OverlayPortalController();
  late AnimationController _controller;
  late Animation<double> _rippleAnimation;
  late Animation<double> _animation;

  int iconIndex = 0;
  final double _begin = 20;
  final double _end = 15;
  bool _onHideBorder = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    _animation = CurvedAnimation(
        parent: widget.animationController, curve: Curves.easeInOut);

    _rippleAnimation = Tween<double>(begin: _begin, end: _end).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _onHideBorder = false);
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _onHideBorder = true;
      widget.animationController.forward();
      _overlayPortalController.show();
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          children: [
            _buildOverlayPortal(),
            _buildStaticIcon("assets/svgs/send.svg"),
          ],
        );
      },
    );
  }

  Widget _buildOverlayPortal() {
    return OverlayPortal(
      controller: _overlayPortalController,
      overlayChildBuilder: (context) => _buildOverlayContent(),
      child: Tooltip(
        message: "",
        child: InkResponse(
          onTap: _onTap,
          containedInkWell: true,
          highlightShape: BoxShape.circle,
          splashColor: Colors.transparent,
          child: _buildAnimatedIcon(),
        ),
      ).scale(animationDuration: 1500.ms, delay: 200.ms),
    ).addHeight(6.h);
  }

  Widget _buildOverlayContent() {
    return Positioned(
      bottom: 165.h,
      left: 30.w,
      child: Transform.scale(
        scale: _animation.value,
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 18, 8, 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildOverlayItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOverlayItems() {
    final icons = ["security", "wallet", "shield", "layer"];
    final labels = [
      "Cosy areas",
      "Price",
      "Infrastructure",
      "Without any layer"
    ];

    return List.generate(
      4,
          (index) => Row(
        children: [
          SvgPicture.asset(
            "assets/svgs/${icons[index]}.svg",
            height: 20,
            color: index == 1 ? AppColors.primary : AppColors.tertiary,
          ),
          Text(
            labels[index],
            style: AppStyle.small.copyWith(
              color: index == 1 ? AppColors.primary : AppColors.tertiary,
            ),
          ),
        ].rowInPadding(10),
      ).onTapWidget(
        tooltip: labels[index],
        onTap: () {
          if (index == 3) {
            // First, update the state synchronously
            setState(() {
              // This just triggers the UI update immediately
            });

            // Then trigger the animation asynchronously without setState()
            widget.animationController.reverse();
          }
        },
      ),
    ).columnInPadding(15);
  }


  Widget _buildAnimatedIcon() {
    return AnimatedContainer(
      duration: 10.ms,
      padding: const EdgeInsets.all(14),
      curve: Curves.easeInOut,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.white2,
        shape: BoxShape.circle,
        border: _onHideBorder
            ? Border.all(color: AppColors.black.withOpacity(0.8), width: 1)
            : null,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (iconIndex == 0)
            AnimatedBuilder(
              animation: _rippleAnimation,
              builder: (context, child) => _onHideBorder
                  ? Center(
                      child: CustomPaint(
                          painter: NavBarPainter(_rippleAnimation.value)))
                  : const SizedBox.shrink(),
            ),
          Transform.rotate(
            angle: 0,
            child: SvgPicture.asset(
              "assets/svgs/layer.svg",
              color: AppColors.white.withOpacity(0.8),
              height: 17,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticIcon(String assetPath) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(14),
      decoration:
          const BoxDecoration(color: AppColors.white2, shape: BoxShape.circle),
      child: SvgPicture.asset(assetPath,
          color: AppColors.white.withOpacity(0.8), height: 17, width: 20),
    ).scale(animationDuration: 1500.ms, delay: 200.ms);
  }
}
