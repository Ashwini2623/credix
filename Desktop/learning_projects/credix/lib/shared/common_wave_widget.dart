import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'constants.dart';

class CommonWaveWidget extends StatelessWidget {
  const CommonWaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: WaveWidget(
        config: CustomConfig(
          colors: [
            kBlueColor.shade100,
            const Color.fromARGB(255, 218, 229, 247),
          ],
          durations: [18000, 8000],
          heightPercentages: [0.65, 0.66],
        ),
        size: const Size(double.infinity, double.infinity),
        waveAmplitude: 25.0,
      ),
    );
  }
}
