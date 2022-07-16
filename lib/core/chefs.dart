import 'package:flutter/material.dart';
import 'package:kimyapar/core/chef.dart';
import 'package:kimyapar/home.dart';
import 'package:kimyapar/models/UserModel.dart';
import 'package:kimyapar/models/chefmodel.dart';
import 'package:kimyapar/services/getUser.dart';

import '../languages/tr.dart';

class ChefsList extends StatefulWidget {
  const ChefsList({Key? key}) : super(key: key);
  @override
  State<ChefsList> createState() => _ChefsListState();
}

class _ChefsListState extends State<ChefsList> {
 @override
  void initState() {
    list = UserHelper.filterGeo();
    super.initState();
  }
 @override
  static List<UserModel> list = [];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(Tr.appbarTitle, style: Styles.appbarTextStyle),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
           return ListTile(title: Text(list[index].name),subtitle: Text(list[index]),);
        })
      ),
    );
  }

  void fillModel() {}
}
