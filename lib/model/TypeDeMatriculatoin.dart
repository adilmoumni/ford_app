class TypeDeMatriculation {
  int id;
  String name;

  TypeDeMatriculation(this.id, this.name);

  static List<TypeDeMatriculation> getCompanies() {
    return <TypeDeMatriculation>[
      TypeDeMatriculation(1, 'E'),
      TypeDeMatriculation(2, 'H'),
      TypeDeMatriculation(3, 'D'),
      TypeDeMatriculation(4, 'B'),
      TypeDeMatriculation(5, 'A'),
      TypeDeMatriculation(6, 'WW'),
    ];
  }
}
