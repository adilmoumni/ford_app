class CarModel {
  int id;
  String name;
  String urlModel;

  CarModel(this.id, this.name, this.urlModel);

  static List<CarModel> getListCarModel() {
    return <CarModel>[
      CarModel(0, 'Choisir', ''),
      CarModel(90, 'KUGA',
          'https://www.gpas-cache.ford.com/guid/411a619b-cafc-368c-862a-209a594628ca.png'),
      CarModel(
          142, 'FOCUS', 'https://pngimg.com/uploads/ford/ford_PNG12204.png'),
      CarModel(89, 'FUSION',
          'https://www.pngitem.com/pimgs/m/1-10859_ford-png-image-ford-fusion-16-white-transparent.png'),
      CarModel(87, 'ECOSPORT',
          'https://di-uploads-pod14.dealerinspire.com/kingsford/uploads/2018/04/ford_ecosport2018_blue.png'),
      CarModel(150, 'RAPTOR',
          'https://www.pngitem.com/pimgs/m/128-1287881_red-ford-f150-raptor-hd-png-download.png'),
    ];
  }
}
