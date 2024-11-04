import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/constants/app_colors.dart';
import 'package:flutter_assessment/core/themes/app_style.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({
    required this.assetPath,
    required this.sliderWidth,
    this.sliderHeight = 40,
    required this.sliderText,
    required this.textOpacity,
    this.sliderTextAlignment = Alignment.centerLeft,
    this.height,
    super.key,
  });

  final String assetPath;
  final double sliderWidth;
  final double sliderHeight;
  final String sliderText;
  final double textOpacity;
  final Alignment sliderTextAlignment;
  final double? height;

  @override
  HomeCardState createState() => HomeCardState(); // Change to HomeCardState
}

class HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(widget.assetPath),
          fit: BoxFit.cover,
        ),
      ),
      child: _buildSliderContainer(),
    );
  }

  Widget _buildSliderContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      width: widget.sliderWidth + widget.sliderHeight,
      height: widget.sliderHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          _buildBlurEffect(),
          _buildSliderText(),
          _buildChevronIcon(),
        ],
      ),
    );
  }

// Additional Helper Methods

  Widget _buildBlurEffect() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color:
                AppColors.lightBrown.withAlpha(160), // Semi-transparent color
          ),
        ),
      ),
    );
  }

  Widget _buildSliderText() {
    return Align(
      alignment: widget.sliderTextAlignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedOpacity(
          opacity: widget.textOpacity,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
          child: Text(
            widget.sliderText,
            textAlign: TextAlign.center,
            style: AppStyle.small.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChevronIcon() {
    return Align(
      alignment: Alignment.centerRight,
      child: CircleAvatar(
        radius: widget.sliderHeight / 2,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.chevron_right,
          size: 15,
          color: AppColors.lightBrown,
        ),
      ),
    );
  }
}
