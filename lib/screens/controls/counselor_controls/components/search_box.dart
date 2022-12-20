import 'package:vonette_web/constants.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  const SearchBox({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        //fillColor: bgColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Icon(
              Icons.search,
              //color: iconColor,
            ),
          ),
        ),
        hintText: hintText,
        //hintStyle: TextStyle(color: textColor),
      ),
    );
  }
}
