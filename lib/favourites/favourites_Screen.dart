
import 'package:flutter/material.dart';
import 'package:gam3a/home/home.dart';
import 'package:gam3a/model/category_page.dart';
import 'package:gam3a/model/property_model.dart';
import 'package:gam3a/profile/mytheme.dart';
import 'package:line_icons/line_icons.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.blueBorder,
        title: Text("Favourites"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "What You Liked",
                //   style: Theme.of(context).textTheme.headline6,
                // ),
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 4,
                //     horizontal: 8,
                //   ),
                //
                // ),
                const SizedBox(
                  height: 12,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: properties.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpandedRecommendationCard(
                      propertyModel: properties[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}