import 'package:flutter/material.dart';

class DaysInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;

  const DaysInfoAppBar({
    Key? key,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Weather"),
      centerTitle: true,
    );
  }
}
