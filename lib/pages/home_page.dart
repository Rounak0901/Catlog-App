// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/models/catlog.dart';
import 'package:my_app/widgets/item_widget.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummyList[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
