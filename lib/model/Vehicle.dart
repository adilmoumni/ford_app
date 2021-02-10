class Vehicle {
  String idModele;
  String nom;
  String categorie;
  String marque;
  String photo;

  Vehicle({this.idModele, this.nom, this.categorie, this.marque, this.photo});

  Vehicle.fromJson(Map<String, dynamic> json) {
    idModele = json['idModele'];
    nom = json['Nom'];
    categorie = json['categorie'];
    marque = json['Marque'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idModele'] = this.idModele;
    data['Nom'] = this.nom;
    data['categorie'] = this.categorie;
    data['Marque'] = this.marque;
    data['photo'] = this.photo;
    return data;
  }
}
