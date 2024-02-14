

class MovResponseModel {
  bool success;
  final List<MovModel> results;

  MovResponseModel({required this.success, required this.results});

  /* Map<String, dynamic> toMap() {
    return {
      "success": success,
      "results": results.map((result) => result.toJson()).toList(),
    };
  } */

 //*  ACA DEBES CAMBIAR EL MODELO *//
  factory MovResponseModel.fromJson(Map<String, dynamic> json) {
    return MovResponseModel(
        success: json['success'] ?? false,
        results: List<MovModel>.from(json['results'].map((x)=> MovModel.fromJson(x) ))
    );
  }

}



class MovModel{

  int? id;
  int? userId;
  int categoryId;
  int tipo;
  String description;
  int value;
  String? fecha;

  MovModel({ this.userId,  this.id, required this.tipo, required this.description, required this.value, this.fecha, required this.categoryId});

  factory MovModel.fromJson(Map<String, dynamic> json) {
    return MovModel(
        userId: json['user_id'] ?? 0,
        id: json['id'] ?? 0,
        categoryId: json['category_id'] ?? 0,
        description : json['description'] ?? '',
        value: json['value'] ?? 0,
        tipo: json['tipo'] ?? 0,
        fecha: json['created_at'] ?? '',
      );
  }

  Map<String, dynamic> toJson()=>{
        'category_id': categoryId,
        'description': description,
        'value': value,
        'tipo': tipo,
  };
}


class MovStoreResponse {
  bool success;
  MovModel results;
  String? message;
  
  MovStoreResponse({required this.success, required this.results, this.message});

  factory MovStoreResponse.fromJson(Map<String,dynamic> objeto){
    var json = objeto['results'];


    return MovStoreResponse(
      success: objeto['success'] ?? false, message: objeto['message'] ?? '', 
      results: MovModel(
        id: (json['id']) ?? 0,
        value: int.parse(json['value'] ?? "0"),
        tipo: (json['tipo']) ?? 0,
        categoryId: (json['category_id']) ?? 0,
        description : json['description'] ?? '',
        fecha: json['created_at'] ?? '',
      )
    );
  }
}
