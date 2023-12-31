
import 'package:flutter/material.dart';
import '../../res/colors/app_colors.dart';
import '../../res/dimentions/app_dimension.dart';

class AppStyle {

  TextStyle headingTextStyle =
  TextStyle(fontSize: AppDimension().defaultText, fontWeight: FontWeight.bold, color: AppColors().colorPrimaryText);

  TextStyle subHeadingTextStyle =
  TextStyle(fontSize: AppDimension().mediumText, fontWeight: FontWeight.w600, color: AppColors().colorSecondaryText);

  TextStyle appbarTitleStyle =
  TextStyle(fontSize: AppDimension().defaultText, fontWeight: FontWeight.w600, color: AppColors().colorText);

  TextStyle linkTextStyle =
  TextStyle(fontSize: AppDimension().defaultText, fontWeight: FontWeight.w600, color: AppColors().colorLink);

  TextStyle whiteTextStyle =
  TextStyle(fontSize: AppDimension().defaultText, fontWeight: FontWeight.w600, color: Colors.white);

  TextStyle whiteTextSmallStyle =
  TextStyle(fontSize: AppDimension().smallText, fontWeight: FontWeight.w600, color: Colors.white);

  TextStyle drawerTextStyle =
  TextStyle(fontSize: AppDimension().mediumText, fontWeight: FontWeight.w600, color: AppColors().colorAppbarTitle);

  TextStyle drawerSubTextStyle =
  TextStyle(fontSize: AppDimension().mediumText, fontWeight: FontWeight.w400, color: AppColors().colorPrimary.shade900);

  IconThemeData appbarIconTheme =
  IconThemeData(color: AppColors().colorText);

  TextStyle homePieChartMessage =
  TextStyle(fontSize: AppDimension().defaultMargin, fontWeight: FontWeight.w600, color: AppColors().colorAppbarTitle);

  TextStyle homeArtistryInMotionTitle =
  TextStyle(fontSize: AppDimension().defaultMargin, fontWeight: FontWeight.w600, color: AppColors().colorAccent);

  TextStyle homeArtistryInMotionScreenName =
  TextStyle(fontSize: AppDimension().homeSubtitleText, fontWeight: FontWeight.w600, color: AppColors().hintTextColor);

  TextStyle homeProgressText =
  TextStyle(fontSize: AppDimension().mediumText, fontWeight: FontWeight.w600, color: AppColors().colorAppbarTitle);
}