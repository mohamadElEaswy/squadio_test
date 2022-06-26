import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_test/src/commons/global_loading.dart';
import 'package:squadio_test/src/features/details/ui/details_page.dart';
import 'package:squadio_test/src/features/home/provider/home_provider.dart';
import 'package:squadio_test/src/network/network.dart';

import '../model/home_data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return ConditionalBuilder(
            condition: !homeProvider.homeLoading,
            builder: (context) => Center(
              child: SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(20),
                  itemCount: homeProvider.homeData.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < homeProvider.homeList.length - 1) {
                      return actorItem(homeProvider.homeData.results[index]);

                      // HomeCard(data: );
                    } else if (index == homeProvider.homeData.totalResults) {
                      return const SizedBox();
                    } else {
                      homeProvider.getMoreData(homeProvider.homeData.page + 1);
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
            fallback: (BuildContext context) => const GlobalLoading(),
          );
        },
      ),
    );
  }

  Widget actorItem(Result data) => InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              data: data.id.toString(),
            ),
          ),
        ),
        child: Card(
          child: Container(
            height: 200,
            width: 180,
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(
                    NetworkHelper.imageUrl(data.profilePath!),
                    height: 200,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    data.name,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 26.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

// image.tmdb.org/t/p/original/tTlAA0REGPXSZPBfWyTW9ipIv1I.jpg

