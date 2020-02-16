class AppProvider {
  double categoryHeight;
  double categoryWidth;
  double productWidth;
  double productHeight;
  double bigCategoryHeight;
  double bigCategoryWidth;

  void updateCategorySize(double widthScreen) {
//    if (categoryHeight == null) { //TODO uncomment later
    categoryWidth = widthScreen * 0.18;
    categoryHeight = categoryWidth * 1.4;
    productWidth = widthScreen * 0.35;
    productHeight = productWidth * 1.4;
    bigCategoryWidth = categoryHeight * 1.2;
    bigCategoryHeight = bigCategoryWidth * 1.4;
//    }
  }
}
