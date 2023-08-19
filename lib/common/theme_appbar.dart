//https://stackoverflow.com/questions/56621840/how-can-setstate-rebuild-only-appbar
import 'package:flutter/material.dart';

import '../main.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: MyApp.of(context)!.isLightMode()
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
        onPressed: () {
          setState(() {
            MyApp.of(context)?.changeTheme();
          });
        },
      ),
      title: const Text("Standard Return URL"),
    );
  }
}