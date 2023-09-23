class DataModel {
  final String title;
  final String imageName;
  final String price;
  DataModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<DataModel> dataList = [
  DataModel("John Doe", "images/X1.jpg", ""),
  DataModel("Lorem", "images/X2.jpg", ""),
  DataModel("Ipsum", "X3.jpg", ""),
];// TODO Implement this library.