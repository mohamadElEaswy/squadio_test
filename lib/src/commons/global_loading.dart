import 'package:flutter/material.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
