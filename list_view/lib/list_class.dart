class List_class {
  final String? color_name;
  const List_class({this.color_name});
}

List List_data_server = [
  {"color_name": "RED"},
  {"color_name": "YELLOW"},
  {"color_name": "PINK"},
  {"color_name": "BLUE"},
  {"color_name": "PURPLE"},
  {"color_name": "BLACK"},
  {"color_name": "GREEN"},
  {"color_name": "RED"},
  {"color_name": "GREY"},
  {"color_name": "BROWN"},
  {"color_name": "RED"},
  {"color_name": "YELLOW"},
  {"color_name": "PINK"},
  {"color_name": "BLUE"},
  {"color_name": "PURPLE"},
  {"color_name": "BLACK"},
  {"color_name": "GREEN"},
  {"color_name": "RED"},
  {"color_name": "GREY"},
  {"color_name": "BROWN"},
  {"color_name": "RED"},
  {"color_name": "YELLOW"},
  {"color_name": "PINK"},
  {"color_name": "BLUE"},
  {"color_name": "PURPLE"},
  {"color_name": "BLACK"},
  {"color_name": "GREEN"},
  {"color_name": "RED"},
  {"color_name": "GREY"},
  {"color_name": "BROWN"},
];

List<List_class> listModelData() {
  return List_data_server.map(
      (item) => List_class(color_name: item["color_name"])).toList();
}