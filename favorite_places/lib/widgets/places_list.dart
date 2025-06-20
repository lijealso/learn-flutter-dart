import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet.',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
          ref.read(userPlacesProvider.notifier).removePlace(places[index].id);
        },
        key: ValueKey(places[index].id),
        child: ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage:
                FileImage(File(places[index].image.path)),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>
                PlaceDetailScreen(place: places[index])));
          },
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          subtitle: Text(
            places[index].location.address,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
