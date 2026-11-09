import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sights_app/di.dart';
import 'package:sights_app/presentation/places/controller/state/place_list_state.dart';

class PlaceListScreen extends ConsumerWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placeListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Places'),
            switch (state) {
              LoadingState() => const Text('Loading...'),
              EmptyState() => const Text('Empty...'),
              SuccessState() => const Text('Success...'),
              ErrorState() => const Text('Error...'),
            }
          ],
        ),
      ),
    );
  }
}
