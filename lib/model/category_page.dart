
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gam3a/contactnow/contact_now.dart';
import 'package:gam3a/model/property_model.dart';
import 'package:gam3a/profile/mytheme.dart';
import 'package:line_icons/line_icons.dart';
import '../component/components.dart';
import 'category_model.dart';
import 'details_page.dart';


class CategoryPage extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryPage({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> property = FirebaseFirestore.instance.collection('property').snapshots();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: StreamBuilder(
                stream: property ,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.hasError){
                    return const Text('Something went wrong');
                  }
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }
                  final data = snapshot.requireData;
                  return Column(
                    children: [
                      SizedBox(height: 12,),
                      Container(
                        width: width,
                        height: height,
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 12,),
                            itemCount: data.size,
                            itemBuilder:(context, index) {
                              return defulatCard(
                                Area: data.docs[index]["Area"],
                                Bedroom: data.docs[index]["Bedroom"],
                                Bathroom: data.docs[index]["Bathroom"],
                                Details: data.docs[index]["Details"],
                                Location: data.docs[index]["Location"],
                                PhoneNumber: data.docs[index]["PhoneNumber"],
                                Price: data.docs[index]["Price"],
                                Title: data.docs[index]["Title"],
                                image: data.docs[index]["image"],

                              );
                            }
                            ),
                      ),

                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandedRecommendationCard extends StatelessWidget {
  const ExpandedRecommendationCard({
    Key? key,
    required this.propertyModel,
  }) : super(key: key);

  final PropertyModel propertyModel;

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final Stream<QuerySnapshot> property = FirebaseFirestore.instance.collection('property').snapshots();

    return GestureDetector(
      onTap: () {},
      child: Container(
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: property ,
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot){
              if (snapshot.hasError){
                return const Text('Something went wrong');
              }
              if(snapshot.connectionState==ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              final data = snapshot.requireData;
              return Container(
                width: width,
                height: height*0.320,
                child: ListView.builder(
                    itemCount: data.size,
                    itemBuilder:(context, index) {
                      return defulatCard(
                        Area: data.docs[index]["Area"],
                        Bedroom: data.docs[index]["Bedroom"],
                        Bathroom: data.docs[index]["Bathroom"],
                        Details: data.docs[index]["Details"],
                        Location: data.docs[index]["Location"],
                        PhoneNumber: data.docs[index]["PhoneNumber"],
                        Price: data.docs[index]["Price"],
                        Title: data.docs[index]["Title"],
                        image: data.docs[index]["image"],

                      );
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}
