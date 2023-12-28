import 'package:cinemapedia/src/features/movies/domain/actor.dart';
import 'package:cinemapedia/src/features/movies/presentation/controllers/actor_details_view_controller.dart';
import 'package:cinemapedia/src/features/movies/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorDetailsView extends ConsumerWidget {
  const ActorDetailsView({super.key, required this.actorId});

  final String actorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorDetailsAsync = ref.watch(fetchActorDetailsProvider(actorId));

    return Scaffold(
        body: actorDetailsAsync.when(
            data: (actor) => CustomScrollView(
                  slivers: [
                    CustomSliverAppBar(backdropPath: actor.profilePath),
                    _ActorDescription(
                      actor: actor,
                    )
                  ],
                ),
            error: ((error, stackTrace) => Center(child: Text('Error $error'))),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}

class _ActorDescription extends StatelessWidget {
  const _ActorDescription({required this.actor});

  final Actor actor;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Biografía',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: Text(
                        actor.bio,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                )));
  }
}
