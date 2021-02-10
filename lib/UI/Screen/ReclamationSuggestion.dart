import 'package:flutter/material.dart';
import 'package:ford_mobil/UI/Widget/PageViewSteper.dart';
import 'package:ford_mobil/model/StepperModel.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReclamationSuggestion extends KFDrawerContent {
  @override
  _ReclamationSuggestionState createState() => _ReclamationSuggestionState();
}

class _ReclamationSuggestionState extends State<ReclamationSuggestion> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StepperModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageViewSteper(
          onPressed: widget.onMenuPressed,
        ),
      ),
    );
  }
}
