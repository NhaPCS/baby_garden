class AppProvider {
  double categoryHeight;
  double categoryWidth;
  double productWidth;
  double productHeight;
  double bigCategoryHeight;
  double bigCategoryWidth;
  double bgHeaderHeight;
  double expandHeaderHeight;
  double productImageHeight;

  void updateCategorySize(double widthScreen, double heightScreen) {
//    if (categoryHeight == null) { //TODO uncomment later
    categoryWidth = widthScreen * 0.18;
    categoryHeight = categoryWidth * 1.4;
    productWidth = widthScreen * 0.35;
    productHeight = productWidth * 1.4;
    bigCategoryWidth = categoryHeight * 1.2;
    bigCategoryHeight = bigCategoryWidth * 1.4;
    bgHeaderHeight = heightScreen * 0.23;
    expandHeaderHeight = heightScreen * 0.3;
    productImageHeight = heightScreen * 0.32;
    ;
//    }
  }
}
