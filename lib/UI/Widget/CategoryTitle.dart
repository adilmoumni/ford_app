import 'package:flutter/material.dart';
import 'package:ford_mobil/constants.dart';


//Cette gategory est pour faire un liste horizantale
class CategoryTitle extends StatelessWidget {
  final String title;
  final bool active;
  const CategoryTitle({
    Key key,
    this.active = false,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30),
      child: Text(
        title,
        style: Theme.of(context).textTheme.button.copyWith(
              color: active ? Colors.blue[900] : kTextColor.withOpacity(.4),
            ),
      ),
    );
  }
}
