import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.movie_creation_outlined, color: colors.primary),
                const SizedBox(width: 16.0),
                Expanded(child: Text('Cinemapedia', style: titleStyle)),
                const Icon(Icons.search)
              ],
            )));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
