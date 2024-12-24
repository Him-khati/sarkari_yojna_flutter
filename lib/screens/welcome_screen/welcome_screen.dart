import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sarkari_yojna_flutter/main.dart';
import 'package:sarkari_yojna_flutter/screens/welcome_screen/welcom_screen_state.dart';
import 'package:sarkari_yojna_flutter/screens/welcome_screen/welcome_screen_content.dart';
import 'package:sarkari_yojna_flutter/screens/welcome_screen/welcome_screen_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider(
          create: (_) => WelcomeScreenCubit(
            yojnaRepository: getIt.get(),
            logger: getIt.get()
          ),
          child: BlocConsumer<WelcomeScreenCubit, WelcomeScreenStateAndEffect>(
            builder: (context, state) {
                return const WelcomeScreenContent();
            },
            listener: (context, state){
              if(state is WelcomeScreenEffect){
                switch (state){
                  case WelcomeScreenNavigateEffect():
                   final router = GoRouter.of(context);
                   router.goNamed(state.path);
                   break;
                }
              }
            }
          ),
        ),
      ),
    );
  }
}
