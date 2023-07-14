import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/appbar.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ' Weather'),
      body: Center(child: Text('Soon we will add the weather to the application'),),



    );
  }
}