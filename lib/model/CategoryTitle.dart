import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryTitle {
  final int id;
  final String title;
  final bool selected;

  CategoryTitle(this.id, this.title, this.selected);

  CategoryTitle.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        selected = json['selected'];

  static Future<List<CategoryTitle>> browser() async {
    String url = 'https://run.mocky.io/v3/4b428384-a889-4ae7-90d9-0a2ad3d763e9';
    http.Response response = await http.get(url);
    String content = response.body;
    List collection = json.decode(content);
    List<CategoryTitle> _category =
        collection.map((json) => CategoryTitle.fromJson(json)).toList();

    return _category;
  }

  Future<List<CategoryTitle>> getList() async {
    List<CategoryTitle> _category = List<CategoryTitle>();
    CategoryTitle c1 = CategoryTitle(1, 'CAT1', false);
    CategoryTitle c2 = CategoryTitle(2, 'CAT2', false);
    CategoryTitle c3 = CategoryTitle(3, 'CAT3', false);
    CategoryTitle c4 = CategoryTitle(4, 'CAT4', false);

    _category.add(c1);
    _category.add(c2);
    _category.add(c3);
    _category.add(c4);

    return _category;
  }
}
