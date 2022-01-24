
import 'package:flutter/material.dart';
import 'package:rickandmorty/styles/text_styles.dart';

class IndicatorLoad extends StatelessWidget {
  const IndicatorLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color:Color.fromRGBO(223,228,231,1)
        ),
        SizedBox(height: 10,),
        Text("Loading...Please wait",
          style: titleListStyle,
        )
      ],
    );
  }
}