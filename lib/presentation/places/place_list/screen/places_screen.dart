import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/presentation/places/place_list/controller/state/place_list_state.dart';
import 'package:sights_app/presentation/places/widget/place_card.dart';
import 'package:sights_app/presentation/style/app_text_styles.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placeListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: switch (state) {
          LoadingState() => LoadingStateWidget(),
          EmptyState() => EmptyStateWidget(),
          LoadedState(places: final placeList) => PlacesList(places: placeList),
          ErrorState() => ErrorStateWidget(),
        },
      ),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/animations/loading_sights.json', width: 50, height: 50));
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset('assets/images/no_locations_found.png', width: 200),
          const SizedBox(height: 20),
          Text('No places found.', style: AppTextStyles.stateTitle),
          const SizedBox(height: 5),
          Text('Try to refresh the screen or check later.'),
        ],
      ),
    );
  }
}

class PlacesList extends StatelessWidget {
  final List<Place> places;

  const PlacesList({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Places', style: AppTextStyles.title),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: places.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => PlaceCard(place: places[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset('assets/images/error_image.png', width: 300),
          Text('There was an error.', style: AppTextStyles.stateTitle),
          const SizedBox(height: 5),
          Text(
            'Please try again later or check your\ninternet connection.',
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
