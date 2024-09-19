import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String? postId;
  String? coatType; //tipo da pelagem
  String? coatColor; //cor da pelagem
  String? size; //tamanho do animal
  String? sex; //sexo do animal
  String? collar; //coleira
  String? bruised; //machucado
  String? malnourished; //desnutrido
  String? meek; //dócil
  String? user;
  List<dynamic>? photos;
  GeoPoint? location;
  String? publicationDate;

  PostModel({
    this.postId,
    this.collar,
    this.coatType,
    this.size,
    this.bruised,
    this.malnourished,
    this.meek,
    this.user,
    this.photos,
    this.location,
    this.publicationDate,
  });

  Map<String, dynamic> toMap() {
    return {
      if (collar != null) 'collar': collar,
      if (coatType != null) 'coatType': coatType,
      if (size != null) 'size': size,
      if (bruised != null) 'bruised': bruised,
      if (malnourished != null) 'malnourished': malnourished,
      if (meek != null) 'meek': meek,
      if (user != null) 'user': user,
      if (photos != null) 'photos': photos,
      if (location != null) 'location': location,
      if (publicationDate != null) 'publicationDate': publicationDate,
    };
  }

  PostModel.fromJson(Map<String, dynamic> json)
      : collar = json['collar'],
        coatType = json['coatType'],
        size = json['size'],
        bruised = json['bruised'],
        malnourished = json['malnourished'],
        meek = json['meek'],
        user = json['user'],
        photos = json['photos'],
        location = json['location'],
        publicationDate = json['publicationDate'];

  factory PostModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return PostModel.fromJson(data);
  }

  @override
  String toString() {
    return "Coleira: $collar\n Cor da pelagem: $coatType\n Porte: $size \n Machucado: $bruised\n Desnutrido: $malnourished\n Dócil: $meek\n Usuário: $user\n Localização: $location\n Data e hora: $publicationDate\n";
  }
}
