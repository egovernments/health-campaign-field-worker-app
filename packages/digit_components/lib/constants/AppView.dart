class AppSizes {
  /// Define breakpoints for different views
  static const double mobileViewWidth = 400.0;
  static const double tabletViewWidth = 700.0;
}

class AppView {
  /// Determine the current view based on the screen width
  static bool isMobileView(double screenWidth) {
    return screenWidth < AppSizes.mobileViewWidth;
  }

  static bool isTabletView(double screenWidth) {
    return screenWidth >= AppSizes.mobileViewWidth && screenWidth < AppSizes.tabletViewWidth;
  }

  static bool isDesktopView(double screenWidth) {
    return screenWidth >= AppSizes.tabletViewWidth;
  }
}
