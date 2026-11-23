import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/domain/model/place.dart';
import 'package:sights_app/presentation/config/app_router.dart';
import 'package:sights_app/presentation/places/list/controller/state/place_list_state.dart';
import 'package:sights_app/presentation/places/list/widget/place_card.dart';
import 'package:sights_app/presentation/style/text_styles.dart';

class PlaceListScreen extends ConsumerWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placeListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text('Places', style: AppTextStyles.mainTitle),
              switch (state) {
                LoadingState() => Expanded(child: LoadingWidget()),
                EmptyState() => Expanded(child: EmptyWidget()),
                SuccessState(placeList: final places) => Expanded(child: PlaceListWidget(places: places)),
                ErrorState() => Expanded(child: ErrorWidget()),
              },
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/animations/loading_sights.json', width: 65),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

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
          Text('Try to refresh the screen or check later'),
        ],
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset('assets/images/error_image.png', width: 250),
          Text('There was and error', style: AppTextStyles.stateTitle),
          Text(
            'Please try again later or check\nyour internet connection.',
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}

class PlaceListWidget extends StatelessWidget {
  final List<Place> places;

  const PlaceListWidget({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: places.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => _redirectToDetails(context, places[index]),
        child: PlaceCard(place: places[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }

  void _redirectToDetails(BuildContext context, Place place) {
    Navigator.of(context).pushNamed(AppRouter.details, arguments: place);
  }
}
