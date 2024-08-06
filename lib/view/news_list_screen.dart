import 'package:flutter/material.dart';
import 'package:machine_test/view/widgets/custom_card.dart';



class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});
  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}
class _NewsListScreenState extends State<NewsListScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text("News Today"),
      centerTitle: true,),
      body:  ListView.separated(itemBuilder: (context, index) {
        return CustomCard(title: 'fuifuiwefuigwfuiw', keywords: "fguifgiufg", summary: "hfuihfuighuif", content: "fbfgieuigf");
      }, separatorBuilder: (context, index) {
        return Divider();
      }, itemCount: 10),
    
    );
  }        
}