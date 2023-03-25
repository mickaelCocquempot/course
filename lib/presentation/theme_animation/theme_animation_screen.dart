import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_03/application/theme_service.dart';
import 'package:task_03/presentation/theme_animation/widgets/moon.dart';
import 'package:task_03/presentation/theme_animation/widgets/star.dart';
import 'package:task_03/presentation/theme_animation/widgets/sun.dart';

class ThemeAnimationScreen extends StatelessWidget {
  const ThemeAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme Animation'),
      ),
      body: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(0, 3),
                      blurRadius: 15,
                      spreadRadius: 4,
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                      colors: themeService.isDarkModeOn
                          ? const [
                              Color(0xFF94A9FF),
                              Color(0xFF6B66CC),
                              Color(0xFF200F75)
                            ]
                          : const [
                              Color(0xDDFFFA66),
                              Color(0xDDFFA057),
                              Color(0xDD940B99)
                            ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
                child: Stack(
                  children: [
                    Positioned(top: 250, right: 280 ,child:  AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: themeService.isDarkModeOn ? 1 : 0,
                          child: const Star()),),
                    Positioned(top: 30, right: 40 ,child:  AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: themeService.isDarkModeOn ? 1 : 0,
                          child: const Star()),),
                    Positioned(top: 50, right: 340 ,child:  AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: themeService.isDarkModeOn ? 1 : 0,
                          child: const Star()),),
                     Positioned(top: 100, right: 200 ,child:  AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: themeService.isDarkModeOn ? 1 : 0,
                          child: const Star()),),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 400),
                      top: themeService.isDarkModeOn ? 100 : 130,
                      right: themeService.isDarkModeOn ? 100 : -40,
                      child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: themeService.isDarkModeOn ? 1 : 0,
                          child: const Moon()),
                    ),
                    AnimatedPadding(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.only(
                            top: themeService.isDarkModeOn ? 110 : 50),
                        child: const Center(child: Sun())),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 225,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: themeService.isDarkModeOn
                                ? Colors.grey[850]
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                themeService.isDarkModeOn
                                    ? 'to light?'
                                    : 'to dark ?',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    color: themeService.isDarkModeOn
                                        ? Colors.white
                                        : Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                themeService.isDarkModeOn
                                    ? 'let the sun rise'
                                    : 'let it be night',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: themeService.isDarkModeOn
                                        ? Colors.white
                                        : Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Switch(
                                value: themeService.isDarkModeOn,
                                onChanged: (_) {
                                  themeService.toggleTheme();
                                },
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
