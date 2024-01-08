class UnBoardingContent{
  String image;
  String title;
  String description;
  UnBoardingContent({
    required this.description,
    required this.image,
    required this.title });
}

List<UnBoardingContent> contents= [
  UnBoardingContent(
      description: 'Explore a wide variety of cuisines and more on BlinkBuy',
      image: "images/3509263.jpg",
      title: 'More Than Just Food on BlinkBuy'
  ),
  UnBoardingContent(
      description: 'Choose from a range of secure payment options',
      image: "images/7069728_3412435.jpg",
      title: 'Secure Payment Options at Your Fingertips'
  ),
  UnBoardingContent(
      description: 'Get instant confirmation on your BlinkBuy orders',
      image: "images/8392610_3905230.jpg",
      title: 'Instant Order Confirmation with BlinkBuy'
  ),
];
