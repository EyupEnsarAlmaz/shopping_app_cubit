import 'package:flutter/material.dart';

class loadingCenter extends StatelessWidget {
  const loadingCenter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
