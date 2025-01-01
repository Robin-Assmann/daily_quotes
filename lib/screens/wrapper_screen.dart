import 'package:animated_background/animated_background.dart';
import 'package:auto_route/auto_route.dart';
import 'package:daily_quotes/bloc/quote_state.dart';
import 'package:daily_quotes/data/wiki_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteCubit, WikiData?>(builder: (context, data) {
      final color = data?.color() ?? Colors.grey;

      return Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
                baseColor: color,
                spawnOpacity: 0.0,
                opacityChangeRate: 0.25,
                minOpacity: 0.1,
                maxOpacity: 0.4,
                spawnMinSpeed: 30.0,
                spawnMaxSpeed: 70.0,
                spawnMinRadius: 7.0,
                spawnMaxRadius: 15.0,
                particleCount: 40,
              ),
            ),
            vsync: this,
            child: SingleChildScrollView(
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    color: color.withOpacity(1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsetsDirectional.fromSTEB(25, 50, 25, 25),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Container(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(25, 25, 25, 25),
                      child: AutoRouter(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.black54,
          backgroundColor: color,
          onPressed: () => context.read<QuoteCubit>().refreshData(),
          tooltip: 'New Quote',
          child: const Icon(Icons.refresh),
        ),
      );
    });
  }
}
