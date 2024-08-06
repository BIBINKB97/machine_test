import 'package:flutter/material.dart';
import 'package:machine_test/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:machine_test/controller/api_provider.dart';
import 'package:machine_test/model/api_model.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});
  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // To fetch customers data when the screen initializes
    Future.delayed(Duration.zero, () {
      Provider.of<NewsProvider>(context, listen: false).fetchNews();
    });
    scrollController.addListener(_scrollListner);
  }
  final scrollController = ScrollController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kumudam News",style: TextStyle(color: kred,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, _) {
          if (provider.news.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            controller: scrollController,
            itemCount: provider.news.length + 1,
            itemBuilder: (context, index) {
              if (index == provider.news.length) {
                return Center(child: CircularProgressIndicator());
              }

              NewsModel news = provider.news[index];

              return Card(
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                                "${Provider.of<NewsProvider>(context, listen: false).imgUrl}${news.imageMid}",),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news.title ?? 'Loading error',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              news.summary ?? 'Loading error',
                              style: TextStyle(fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => kHeight1,
          );
        },
      ),
    );
  }
  void _scrollListner() {
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
     Provider.of<NewsProvider>(context, listen: false).fetchNews();
    }
    print("dont call");
  }
}
