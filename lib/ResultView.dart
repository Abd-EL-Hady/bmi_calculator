import 'package:flutter/material.dart';

import 'appcustoms.dart';


class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.result});
  final double result;
  String getClassification() {
    if (result < 16) {
      return 'Severe Thinness';
    } else if (result >= 16 && result <= 17) {
      return 'Moderate Thinness';
    } else if (result >= 18.5 && result <= 25) {
      return 'Normal';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Your Result',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.containerBg,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getClassification(),
                      style: TextStyle(color: AppColors.green, fontSize: 22),
                    ),
                    Text(
                      result.toStringAsFixed(2),
                      style: TextStyle(color: AppColors.white, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your Body Weight is absolutely ${getClassification()}',
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primary,
                    // foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'RE-CALCULATE',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
