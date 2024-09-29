import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/controller/search_screen_controller.dart';
import 'package:flutter_application_news_app/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchScreenController(),)
      ],
      child: MaterialApp(
        home: SearchScreen(
      
        ),
      ),
    );
  }
}