import 'package:flutter/material.dart';
import '../models/place.dart';
import '../screens/places_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No places added yet!'),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: FileImage(places[index].image),
          ),
          title: Text(
            places[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PlacesDetailScreen(
                    place: places[index],
                  ),
                ),
              )),
    );
  }
}
