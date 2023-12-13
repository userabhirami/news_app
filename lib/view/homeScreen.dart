import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/controller/mycontroller.dart';
import 'package:news_app/model/modelclass.dart';
import 'package:news_app/view/secondScreen.dart';
import 'package:news_app/view/widgets/homeScreen_Widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Model mymodel = Model();
  // Map<String, dynamic> decodeData = {};

  @override
  initState() {
    getData();

    super.initState();
  }

  Future<void> getData() async {
    // await controller.fetchData();
    await Provider.of<MyController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MyController>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("NewsApp"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(),
                      ));
                },
                icon: Icon(Icons.more_vert)),
          ],
        ),
        body:
            //controller.isloading == true
            //    ? Center(child: CircularProgressIndicator()):
            ListView.builder(
          itemCount: 309,
          itemBuilder: (context, index) => HomeScreenWidget(
            title: controller.mymodel.articles?[index].title ?? "",
            des: controller.mymodel.articles?[index].description ?? "",
            date: controller.mymodel.articles?[index].publishedAt.toString() ??
                "",
            author: controller.mymodel.articles?[index].author ?? "",
            image: controller.mymodel.articles?[index].urlToImage ?? "",
          ),
        ));
  }
}
