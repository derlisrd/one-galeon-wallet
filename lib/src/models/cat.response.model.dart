class CatResponseModel {

  bool success;
  List<CatModel> results = [];

  CatResponseModel({required this.success, required this.results});

  //*  ACA DEBES CAMBIAR EL MODELO *//
  factory CatResponseModel.fromJson(Map<String, dynamic> json) {
    return CatResponseModel(
        success: json['success'] ?? false,
        results: List<CatModel>.from(json['results'].map((x)=> CatModel.fromJson(x) ))
    );
  }

}



class CatModel {

  int id;
  String icon;
  String description;

  CatModel({required this.id, required this.icon, required this.description});


factory CatModel.fromJson(Map<String, dynamic> json) {
    return CatModel(
        id: json['id'] ?? 0,
        icon: json['icon'] ?? '',
        description : json['description'] ?? '',
      );
  }

  Map<String, dynamic> toJson()=>{
        'description': description,
        'icon': icon
  };


}