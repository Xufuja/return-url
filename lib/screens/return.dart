// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/theme_appbar.dart';

class MyReturn extends StatelessWidget {
  final String title = "Standard Return URL";

  const MyReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: title,
      ),
      //https://stackoverflow.com/questions/52784064/set-column-width-in-flutter
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 7,
              //https://stackoverflow.com/questions/46856559/flutter-listview-with-map-instead-of-list
              child: Column(
                children: [
                  const Text("Query Parameters",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  //https://stackoverflow.com/questions/52677267/flutter-listview-builder-hide-the-divider-on-last-list-item
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: Uri.base.queryParameters.length,
                    itemBuilder: (context, index) {
                      String key =
                          Uri.base.queryParameters.keys.elementAt(index);
                      return ListTile(
                        leading: Text((index + 1).toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText("Key: " + key),
                            SelectableText(
                                "Value: ${Uri.base.queryParameters[key]}"),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 2.0,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
