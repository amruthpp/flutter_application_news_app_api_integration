import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_news_app/controller/search_screen_controller.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  

  @override
  Widget build(BuildContext context) {

 final searchSreenProvider = context.watch<SearchScreenController>();

    return Scaffold(
      body: SafeArea(
        child:Column(
children: [
  SearchBar(
    controller: controller,
    leading: IconButton(onPressed: (){
      context.read()<SearchScreenController>().onSearch(controller.text);
    },
     icon: Icon(Icons.search)),
    onChanged: (value) {
      if (value.isNotEmpty) {
        context.read<SearchScreenController>()
        .onSearch(controller.text);
      }
    
    },
  ),
  Expanded(
    child: Builder(
      builder: (context) {
      if(searchSreenProvider.isLoading){
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (searchSreenProvider.newsArticles.isEmpty){
        return Center(
          child: Text("no results"),
    
        );
    
      } else {
        return ListView.separated(itemBuilder: (context, index) => 
        Container(
          child: ListTile(
            title: Text(searchSreenProvider.newsArticles[index].title.toString()),
            leading: CachedNetworkImage(
              imageUrl: searchSreenProvider.newsArticles[index].urlToImage.toString(),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              
              
              
              ) ,
              
              
            
          ),
        ),
         separatorBuilder: (context, index) => SizedBox(height: 20,),
          itemCount: searchSreenProvider.newsArticles.length);
      }
    },),
  )
],
        ) 
        ),
      
    );
  }
}