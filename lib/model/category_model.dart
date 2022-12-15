class CategoryModel {
  String id;
  String imagePath;
  String title;
  int color;

  CategoryModel(
      {required this.id,
      required this.imagePath,
      required this.title,
      required this.color});

  static List<CategoryModel> getCategoryItem() {
    return [
      CategoryModel(
          id: 'sport',
          imagePath: 'assets/images/sports.png',
          title: 'Sport',
          color: 0xffC91C22),
      CategoryModel(
          id: 'politics',
          imagePath: 'assets/images/Politics.png',
          title: 'Politics',
          color: 0xff003E90),
      CategoryModel(
          id: 'health',
          imagePath: 'assets/images/health.png',
          title: 'Health',
          color: 0xffED1E79),
      CategoryModel(
          id: 'business',
          imagePath: 'assets/images/bussines.png',
          title: 'Business',
          color: 0xffCF7E48),
      CategoryModel(
          id: 'environment',
          imagePath: 'assets/images/environment.png',
          title: 'Environment',
          color: 0xff4882CF),
      CategoryModel(
          id: 'science',
          imagePath: 'assets/images/science.png',
          title: 'Science',
          color: 0xffF2D352),
    ];
  }
}
