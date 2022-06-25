import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_test/src/features/details/provider/details_provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  // @override
  // void initState() {
  //   super.initState();
  //   context.watch<DetailsProvider>().getPersonDetails(widget.data);
  // }
// .getPersonDetails(widget.data)
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(
      builder: (context, value, child) {
        // instead of init state or Future builder 
        value.getPersonDetails(data);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(value.data),
          ),
        );
      },
    );
  }
}
