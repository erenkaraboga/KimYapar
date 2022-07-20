import 'package:flutter/material.dart';
import 'package:kimyapar/constants/styles.dart';
import 'package:kimyapar/product/widgets/chefWidget.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(Tr.appbarTitle, style: TextStyles.appbarTextStyle),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                UserHelper().filterGeo();
              })),
      body: FutureBuilder<List<UserModel>>(
        future: UserHelper().filterGeo(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.done) {
            if (snap.hasData) {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: ((context, index) {
                    var model = UserModel();
                    model = snap.data![index];
                    return Column(
                      children: [
                        ListTile(
                          title: Text(model.name!),
                        )
                      ],
                    );
                  }));
            } else {
              return const Text(Tr.error);
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
