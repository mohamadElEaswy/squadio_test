import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import '../../../commons/gloabl_network_iage_widget.dart';
import '../../../network/network.dart';

class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                // await ImageDownloader.downloadImage(imageUrl);
                // try {
                //   // Saved with this method.
                //   var imageId = await ImageDownloader.downloadImage(
                //     imageUrl,
                //     destination: AndroidDestinationTypeinExternalFilesDir(),
                //   );
                //   if (imageId == null) {
                //     return;
                //   }

                //   // Below is a method of obtaining saved image information.
                //   var fileName = await ImageDownloader.findName(imageId);
                //   var path = await ImageDownloader.findPath(imageId);
                //   var size = await ImageDownloader.findByteSize(imageId);
                //   var mimeType = await ImageDownloader.findMimeType(imageId);
                //   imageId;
                // } on PlatformException catch (error) {
                //   print(error);
                // }

                ImageDownloader.downloadImage(
                  NetworkHelper.imageUrl(imageUrl),
                ).catchError((error) {
                  if (error is PlatformException) {
                    var path = "";
                    if (error.code == "404") {
                      print("Not Found Error.");
                    } else if (error.code == "unsupported_file") {
                      print("UnSupported FIle Error.");
                      path = error.details["unsupported_file_path"];
                    }
                  }
                });
              },
              icon: const Icon(Icons.download),
              label: const Text('Download'),
            ),
          ],
        ),
        body: Center(child: GlobalNetworkImage(filePath: imageUrl)),
      );
}
