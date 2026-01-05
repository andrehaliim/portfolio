class ProjectModel {
  String title;
  String subtitle;
  String year;
  String platform;
  String client;
  String language;
  String logo;
  bool isHover = false;
  List<String> imageList;
  String description;
  String link;

  ProjectModel({
    required this.title,
    required this.subtitle,
    required this.year,
    required this.platform,
    required this.client,
    required this.language,
    required this.logo,
    required this.imageList,
    required this.description,
    this.link = '',
  });
}
