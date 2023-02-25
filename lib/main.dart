import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cats_bloc.dart';
import 'cats_repo.dart';
import 'cats_screen.dart';
import 'dio_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) =>
              CatsRepo(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            CatsBloc(repo: RepositoryProvider.of<CatsRepo>(context)),
        child: const MaterialApp(
          home: CatsScreen(),
        ),
      ),
    );
  }
}
