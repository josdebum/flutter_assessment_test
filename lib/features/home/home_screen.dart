import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/widgets/home_card.dart';
import 'package:flutter_assessment/core/constants/app_colors.dart';
import 'package:flutter_assessment/core/themes/app_style.dart';
import 'package:flutter_assessment/core/utils/char_helper.dart';
import 'package:flutter_assessment/core/utils/extensions.dart';
import 'package:flutter_assessment/core/utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  // Animation for the appbar with entails the location and profile avatar
  late final Animation<double> _appbarAnimation;
  late final Animation<double> _appbarAnimation2;

  // Animation for the name
  late final Animation<double> _nameAnimation;

  late final Animation<double> _textAnimation1;
  late final Animation<double> _textAnimation2;

  late final Animation<double> _containerAnimation;

  late final Animation<double> _imageCardAnimation1;
  late final Animation<double> _imageCardAnimation2;

  late final Animation<double> _imageCardAnimation3;
  late final Animation<double> _imageCardAnimation4;

  late final ScrollController _scrollController;
  late Animation<Offset> _horizontalCardAnimation;

  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _appbarAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.25,
          curve: Curves.easeIn,
        ),
      ),
    );

    _appbarAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.23,
          0.25,
          curve: Curves.easeIn,
        ),
      ),
    );

    _nameAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.15,
          0.35,
          curve: Curves.easeIn,
        ),
      ),
    );

    _textAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.30,
          0.50,
          curve: Curves.decelerate,
        ),
      ),
    );

    _textAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.35,
          0.50,
          curve: Curves.decelerate,
        ),
      ),
    );

    _containerAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.30,
          0.70,
          curve: Curves.easeInOutCirc,
          // curve: Curves.easeOutQuint,
        ),
      ),
    );

    _horizontalCardAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // start offset
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    // _horizontalCardAnimation = Tween<Offset>(
    //   begin: const Offset(0, 0.1), // start offset
    //   end: const Offset(0, 0), // end offset
    // ).animate(CurvedAnimation(
    //   parent:_,
    //   curve: Curves.easeInOut,
    // ));

    _imageCardAnimation1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.69,
          0.89,
          curve: Curves.decelerate,
        ),
      ),
    );

    _imageCardAnimation2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.80,
          0.99,
          curve: Curves.easeIn,
        ),
      ),
    );

    _imageCardAnimation3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.80,
          0.99,
          curve: Curves.easeIn,
        ),
      ),
    );

    _imageCardAnimation4 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.72,
          0.94,
          curve: Curves.easeIn,
        ),
      ),
    );

    // Start the animation
    _animationController.forward();
  }

  void _scrollListener() {
    setState(() {
      scrollOffset = _scrollController.offset;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.white,
              AppColors.white5,
              AppColors.white6,
              AppColors.primary.withOpacity(0.2),
              AppColors.primary.withOpacity(0.5)
            ],
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: false,
                      title: Card(
                          elevation: 0,
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 16.w,
                            ),
                            height: 42.h,
                            width: _appbarAnimation.value * 170,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Opacity(
                              opacity: _appbarAnimation2.value,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: AppColors.lightBrown,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Flexible(
                                    child: Text("Saint Petersburg",
                                        style: AppStyle.small.copyWith(
                                            color: AppColors.lightBrown)),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      actions: [
                        Transform.scale(
                          scale: _appbarAnimation.value,
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.primary,
                              backgroundImage:
                                  AssetImage('assets/pngs/profile_2.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ).paddingTop(6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Opacity(
                            opacity: _nameAnimation.value,
                            child: Text('Hi, Marina',
                                style: AppStyle.header
                                    .copyWith(color: AppColors.lightBrown)),
                          ),
                        ).addHeight(8.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 120.h,
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  height: _textAnimation1.value * 48.h,
                                  color: Colors.transparent,
                                  child: ResizableText(
                                    "let's select your",
                                    baseFontSize: 35,
                                    style: AppStyle.title
                                        .copyWith(color: AppColors.black2),
                                  )),
                              Container(
                                  height: _textAnimation2.value * 48.h,
                                  color: Colors.transparent,
                                  child: ResizableText(
                                    "perfect place",
                                    baseFontSize: 35,
                                    style: AppStyle.title
                                        .copyWith(color: AppColors.black2),
                                  )),
                            ],
                          ),
                        ).addHeight(24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Transform.scale(
                                    scale: _containerAnimation.value,
                                    child: Container(
                                      width: double.infinity,
                                      height: 175.h,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "BUY",
                                              style: AppStyle.small.copyWith(
                                                color: AppColors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24.h,
                                            ),
                                            ResizableText(
                                              CharHelper.addSpaceTo4DigitNumber(
                                                  (_containerAnimation.value *
                                                          1034)
                                                      .toInt()),
                                              baseFontSize: 35,
                                              style: AppStyle.title.copyWith(
                                                  color: AppColors.white),
                                            ),
                                            Text(
                                              "offers",
                                              style: AppStyle.small.copyWith(
                                                  color: AppColors.white,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: Transform.scale(
                                    scale: _containerAnimation.value,
                                    child: Container(
                                      height: 175.h,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            AppColors.white3,
                                            AppColors.white4,
                                            AppColors.white3,
                                            AppColors.white3,
                                            AppColors.white,
                                            AppColors.white
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(24),
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "RENT",
                                              style: AppStyle.small.copyWith(
                                                color: AppColors.lightBrown,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24.h,
                                            ),
                                            ResizableText(
                                              CharHelper.addSpaceTo4DigitNumber(
                                                  (_containerAnimation.value *
                                                          2212)
                                                      .toInt()),
                                              baseFontSize: 35,
                                              style: AppStyle.title.copyWith(
                                                  color: AppColors.lightBrown),
                                            ),
                                            Text(
                                              "offers",
                                              style: AppStyle.small.copyWith(
                                                  color: AppColors.lightBrown,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ).addHeight(10)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: _horizontalCardAnimation,
              child: DraggableScrollableSheet(
                  initialChildSize: 0.40,
                  minChildSize: 0.10,
                  maxChildSize: 0.68,
                  builder:
                      (BuildContext context, ScrollController $controller) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(24)),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        controller: $controller,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HomeCard(
                              assetPath: 'assets/pngs/image_3.jpg',
                              sliderText: "Gladkova St., 25",
                              textOpacity: _imageCardAnimation1.value == 1
                                  ? _imageCardAnimation1.value
                                  : 0,
                              sliderTextAlignment: Alignment.center,
                              sliderWidth: _imageCardAnimation1.value *
                                  MediaQuery.of(context).size.width,
                              sliderHeight: 56,
                              height: 208.h,
                            ).addHeight(10),
                            Row(
                              children: [
                                Expanded(
                                  child: HomeCard(
                                    height: 300.h,
                                    assetPath: 'assets/pngs/image_1.jpg',
                                    sliderText: "Gubina St., 11",
                                    textOpacity: _imageCardAnimation3.value == 1
                                        ? _imageCardAnimation3.value
                                        : 0,
                                    sliderWidth: _imageCardAnimation3.value *
                                        MediaQuery.of(context).size.width,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    children: [
                                      HomeCard(
                                        height: 145.h,
                                        assetPath: 'assets/pngs/image_1.jpg',
                                        sliderText: "Trefoleva St.",
                                        textOpacity:
                                            _imageCardAnimation4.value == 1
                                                ? _imageCardAnimation4.value
                                                : 0,
                                        sliderWidth: _imageCardAnimation4
                                                .value *
                                            MediaQuery.of(context).size.width,
                                      ),
                                      SizedBox(height: 10.h),
                                      HomeCard(
                                        height: 145.h,
                                        assetPath: 'assets/pngs/image_4.jpg',
                                        sliderText: "Trefoleva St.",
                                        textOpacity:
                                            _imageCardAnimation2.value == 1
                                                ? _imageCardAnimation2.value
                                                : 0,
                                        sliderWidth: _imageCardAnimation2
                                                .value *
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).addHeight(100)
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ResizableText extends StatelessWidget {
  final String text;
  final double baseFontSize;
  final TextStyle style;

  const ResizableText(this.text,
      {super.key, required this.baseFontSize, required this.style});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the font size based on the screen width
    double fontSize = baseFontSize *
        (screenWidth / 375); // 375 is a common base width (e.g., iPhone 8)

    return Text(text,
        textAlign: TextAlign.left, style: style.copyWith(fontSize: fontSize));
  }
}
