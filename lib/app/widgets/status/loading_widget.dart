import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key, this.error});

  final Object? error;

  @override
  Widget build(BuildContext context) {
    if (error == null) {
      return const Center(
        child: Text('An error occurred'),
      );
    } else {
      return Center(
        child: Text(error.toString()),
      );
    }
  }
}
