import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gam3a/cubit/cubit.dart';
import 'package:gam3a/homescreen.dart';
import 'package:gam3a/theme.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context)=>RealEstateCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
  // class MyApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  // // Using MultiProvider is convenient when providing multiple objects.
  // return MultiProvider(
  // providers: [
  // // In this sample app, FavoriteListModel never changes, so a simple Provider
  // // is sufficient.
  // Provider(create: (context) => FavoriteListModel()),
  // // FavoritePageModel is implemented as a ChangeNotifier, which calls for the use
  // // of ChangeNotifierProvider. Moreover, FavoritePageModel depends
  // // on FavoriteListModel, so a ProxyProvider is needed.
  // ChangeNotifierProxyProvider<FavoriteListModel, FavoritePageModel>(
  // create: (context) => FavoritePageModel(),
  // update: (context, favoritelist, favoritepage) {
  // if (favoritepage == null)
  // throw ArgumentError.notNull('favoritepage');
  // favoritepage.favoritelist = favoritelist;
  // return favoritepage;
  // },
  // ),
  // ],
  // child: MaterialApp(
  // debugShowCheckedModeBanner: false,
  // title: 'Favorite Provider',
  // theme: appTheme,
  // initialRoute: '/',
  // routes: {
  // '/': (context) => FavoriteList(),
  // '/favoritepage': (context) => FavoritePage(),
  // },
  // ),
  // );
  // }
  }



