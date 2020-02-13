class AppProvider {
  double categoryHeight;
  double categoryWidth;
  double productWidth;
  double productHeight;

  void updateCategorySize(double widthScreen) {
    if (categoryHeight == null) {
      categoryWidth = widthScreen * 0.18;
      categoryHeight = categoryWidth * 1.4;
      productWidth = widthScreen * 0.35;
      productHeight = productWidth * 1.4;
    }
  }
}
