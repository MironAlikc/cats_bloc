import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cats_bloc.dart';

class CatsScreen extends StatelessWidget {
  const CatsScreen({
    super.key,
    //required String image
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        BlocBuilder<CatsBloc, CatsState>(
          builder: (context, state) {
            if (state is CatsSucces) {
              return Image.network(state.image ?? '');
            }
            if (state is CatsError) {
              return Image.network(
                'https://st.depositphotos.com/1431107/1351/i/950/depositphotos_13517069-stock-photo-error-404-icon.jpg',
              );
            }
            return Image.network(
                'https://koshka.top/uploads/posts/2021-12/1640172735_1-koshka-top-p-koshki-dlya-detei-narisovannie-1.png');
          },
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<CatsBloc>(context).add(
              PressButtonEvent(),
            );
          },
          child: const Text('Next'),
        )
      ]),
    );
  }
}
