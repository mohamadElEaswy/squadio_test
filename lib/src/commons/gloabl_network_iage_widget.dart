import 'package:flutter/material.dart';
import 'package:squadio_test/src/network/network.dart';

class GlobalNetworkImage extends StatelessWidget {
  const GlobalNetworkImage({Key? key, required this.filePath})
      : super(key: key);
  final String filePath;
  @override
  Widget build(BuildContext context) => Image.network(
        NetworkHelper.imageUrl(filePath),
        fit: BoxFit.cover,
      );
}