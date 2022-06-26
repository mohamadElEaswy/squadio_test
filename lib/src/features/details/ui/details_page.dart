import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_test/src/features/details/domain/model/images_model.dart';
import 'package:squadio_test/src/features/details/provider/details_provider.dart';
import 'package:squadio_test/src/features/image_preview/ui/image_preview_page.dart';

import '../../../commons/gloabl_network_iage_widget.dart';
import '../../../commons/global_loading.dart';
import '../../../network/network.dart';
import '../../../utils/theme/global_styles.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String birthDate(value) =>
      'Birthdate: ${value.singleDetailModel!.birthday.year} / ${value.singleDetailModel!.birthday.month} / ${value.singleDetailModel!.birthday.day}';
  @override
  void initState() {
    super.initState();
    context.read<DetailsProvider>().getPersonDetails(widget.data.toString());
    // context.read<DetailsProvider>().getImages(widget.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(),
          body: !value.loading && value.singleDetailModel != null
              ? _body(value)
              : const GlobalLoading(),
        );
      },
    );
  }

  Widget _body(DetailsProvider value) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  NetworkHelper.imageUrl(value.singleDetailModel!.profilePath),
                  // height: 200,
                  // width: 100,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 50,
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                      value.singleDetailModel!.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.singleDetailModel!.biography,
                    style: GlobalStyles.bodyTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    birthDate(value),
                    style: GlobalStyles.bodyTextStyle,
                  ),
                  Text(
                    'Place Of Birth: ${value.singleDetailModel!.placeOfBirth}',
                    style: GlobalStyles.bodyTextStyle,
                  ),
                  imagesGrid(value.imagesModel!),
                ],
              ),
            ),
          ],
        ),
      );

  Widget imagesGrid(ImagesModel value) => SizedBox(
        height: 500,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.profiles.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePreviewPage(
                  imageUrl:
                      value.profiles[index].filePath,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  GlobalNetworkImage(filePath: value.profiles[index].filePath),
            ),
          ),
        ),
      );
}


