import 'package:flutter/material.dart';
import 'package:machine_test/utils/utils.dart';

class CustomCard extends StatelessWidget {
  final String  title ;
  final String  keywords ;
  final String  summary ;
  final String content;


  const CustomCard({super.key,
   required this.title,
   required this.keywords,
   required this.summary,
   required this.content,
  });

  @override
  Widget build(BuildContext context) {

         double width = MediaQuery.of(context).size.width;
         double height = MediaQuery.of(context).size.height;
            return Container(
                    height: height*.155,
                    child: Card(
                      color:kwhite,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [],
                        )
                  
                      ),
                    ),
                  );
  }
}