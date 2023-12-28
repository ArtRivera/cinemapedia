import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.backdropPath});

  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sliverAppBarHeight = size.height * 0.7;

    return SliverAppBar(
      expandedHeight: sliverAppBarHeight,
      foregroundColor: Colors.white.withOpacity(0.8),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          SizedBox.expand(
            child: Image.network(backdropPath,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? FadeIn(child: child)
                        : const SizedBox()),
          ),
          SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                  0.7,
                  1
                ],
                        colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.8),
                ]))),
          ),
          SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: const [
                  0,
                  0.2
                ],
                        colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ]))),
          ),
        ]),
      ),
    );
  }
}
