import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String titleSlug;
  final String summary;
  final String content;
 

  const CustomCard({
    super.key,
    required this.title,
    required this.titleSlug,
    required this.summary,
    required this.content,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                Row(
                  children: [
                
                    Text(titleSlug,style: TextStyle(fontSize: 15)),
                  ],
                ),
                Text(summary,style: TextStyle(fontSize: 15)),
                Text(content,style: TextStyle(fontSize: 15)),
              ],
            )),
      ),
    );
  }
}
