import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/theme/theme.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;

  const HomeAppBar({
    Key? key,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<WeatherTheme>();
    return AppBar(
      title: const Text("Weather"),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () => theme.setTheme(),
            icon: const Icon(Icons.emoji_objects))
      ],
    );
  }
}
