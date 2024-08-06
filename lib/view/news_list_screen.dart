import 'package:flutter/material.dart';
import 'package:machine_test/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:machine_test/controller/provider.dart';
import 'package:machine_test/model/model.dart';

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
    // To fetch data when the screen initializes
    Future.delayed(Duration.zero, () {
      Provider.of<NewsProvider>(context, listen: false).fetchData();
    });

    // Add scroll listener to fetch more data
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final provider = Provider.of<NewsProvider>(context, listen: false);
        if (provider.hasMore) {
          provider.fetchData();
        }
      }
    });
  }

  // fuction for refresh
  Future<void> _refreshData() async {
    final provider = Provider.of<NewsProvider>(context, listen: false);
    provider.news.clear();
    provider.offset = 0; // Reset offset for new data
    provider.hasMore = true; // Reset hasMore
    await provider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kumudam News",
          style: TextStyle(color: kred, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, _) {
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: provider.news.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    controller: _scrollController,
                    itemCount: provider.news.length + 1,
                    itemBuilder: (context, index) {
                      if (index == provider.news.length) {
                        if (provider.hasMore) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return SizedBox.shrink(); // if no more items to show
                        }
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
                                        "${Provider.of<NewsProvider>(context, listen: false).imgUrl}${news.imageMid}"),
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
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
                  ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
