import 'package:flutter/material.dart';

class TxetFormFieldContact extends StatefulWidget {
  final String text;
  final onChanged;
  final Function onSaved;
  final Function validator;
  TxetFormFieldContact(
      {Key key, this.text, this.onChanged, this.onSaved, this.validator})
      : super(key: key);

  @override
  _TxetFormFieldContactState createState() => _TxetFormFieldContactState();
}

class _TxetFormFieldContactState extends State<TxetFormFieldContact> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Container(
        // height: 45,
        child: TextFormField(
          onSaved: this.widget.onSaved,
          validator: this.widget.validator,
          onChanged: (value) {
            setState(() {
              widget.onChanged(value);
            });
          },
          decoration: InputDecoration(
            contentPadding:
                new EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            labelText: widget.text,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
