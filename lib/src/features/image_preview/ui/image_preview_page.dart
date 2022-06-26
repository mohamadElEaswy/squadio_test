import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import '../../../commons/gloabl_network_iage_widget.dart';

class ImagePreviewPage extends StatelessWidget {
  const ImagePreviewPage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                await ImageDownloader.downloadImage(imageUrl);
              },
              icon: const Icon(Icons.download),
              label: const Text('Download'),
            ),
          ],
        ),
        body: Center(child: GlobalNetworkImage(filePath: imageUrl)),
      );
}
