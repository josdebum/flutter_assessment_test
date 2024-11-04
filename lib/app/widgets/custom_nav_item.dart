import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/app_colors.dart';
import 'package:flutter_assessment/core/utils/extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavItem extends StatefulWidget {
  const CustomNavItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final String icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<CustomNavItem> createState() => _CustomNavItemState();
}

class _CustomNavItemState extends State<CustomNavItem>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _initialContainerSize;
  late final Animation<double> _initialBorderSize;

  late final Animation<double> _secondContainerSize;
  late final Animation<double> _secondBorderSize;

  bool _showColor = false;
  bool _showOuterCircle = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          setState(() {
            _showColor = true;

            Future.delayed(const Duration(milliseconds: 335), () {
              _showOuterCircle = true;
            });

            Future.delayed(const Duration(milliseconds: 860), () {
              _showOuterCircle = false;
            });

            Future.delayed(const Duration(milliseconds: 1200), () {
              _showColor = false;
            });
          });
        }
      });

    _initialContainerSize = Tween<double>(begin: 58, end: 40).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.easeIn,
        ),
      ),
    );

    _initialBorderSize = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 8),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 8, end: 1),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.75, curve: Curves.easeIn),
      ),
    );

    _secondContainerSize = Tween<double>(begin: 40, end: 58).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.easeIn,
        ),
      ),
    );

    _secondBorderSize = Tween<double>(begin: 8, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.25,
          0.50,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: GestureDetector(
        onTap: () async {
          widget.onTap();
          _animationController.reset();
          _animationController.forward();
        },
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Stack(
            alignment: Alignment.center,
            children: [
              _buildAnimatedContainer(),
              if (widget.isActive) _buildInnerBorder(),
              if (widget.isActive) _buildOuterBorder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 375),
      curve: Curves.decelerate,
      alignment: Alignment.center,
      height: _showColor
          ? 46.h
          : widget.isActive
              ? 52.h
              : 46.h,
      width: _showColor
          ? 46.h
          : widget.isActive
              ? 52.h
              : 46.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _showColor
            ? Colors.transparent
            : widget.isActive
                ? AppColors.primary
                : AppColors.black2,
      ),
      child: SvgPicture.asset('assets/svgs/${widget.icon}.svg',
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          width: 22.w,
          height: 22.h),
    );
  }

  Widget _buildInnerBorder() {
    return Container(
      padding: const EdgeInsets.all(2),
      height: _initialContainerSize.value,
      width: _initialContainerSize.value,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: _showColor ? Colors.white : Colors.transparent,
          width: _initialBorderSize.value,
        ),
      ),
    );
  }

  Widget _buildOuterBorder() {
    return Container(
      padding: const EdgeInsets.all(2),
      height: _secondContainerSize.value,
      width: _secondContainerSize.value,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: _showOuterCircle ? Colors.white : Colors.transparent,
          width: _secondBorderSize.value,
        ),
      ),
    );
  }
}
