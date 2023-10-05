import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> customPageBuilder(navigateTo, double X, double Y) =>
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, animationTime, child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.easeInSine);
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(X, Y),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (context, animation, animationTime) => navigateTo,
    );
