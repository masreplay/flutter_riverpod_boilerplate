import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, this.error});

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
