import 'package:app3/core/themes/app_colors.dart';
import 'package:app3/features/welcome/presentaion/home/home_screen.dart';
import 'package:app3/features/presentaion/cubit/cubit/home_cubit.dart';
import 'package:app3/features/welcome/presentaion/slider/slider_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../gen/assets.gen.dart';

class ButtonNavBarScreen extends StatefulWidget {
  const ButtonNavBarScreen({super.key});

  @override
  State<ButtonNavBarScreen> createState() => _ButtonNavBarScreenState();
}

class _ButtonNavBarScreenState extends State<ButtonNavBarScreen> {
  int currentIndex = 0;

  late final List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getBestSellerBox(),
        ),

        BlocProvider(
          create: (context) => SliderCubit()..getSliders(),
        ),
      ],
      child: const HomeScreen(),
    ),

    const Center(child: Text('BookMark Screen')),
    const Center(child: Text('Cart Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        backgroundColor: AppColors.bgColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,

        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.home.svg(
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? AppColors.mainColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Assets.icons.bookmark.svg(
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? AppColors.mainColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "BookMark",
          ),

          BottomNavigationBarItem(
            icon: Assets.icons.category.svg(
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? AppColors.mainColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Assets.icons.profile.svg(
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? AppColors.mainColor : Colors.black,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
