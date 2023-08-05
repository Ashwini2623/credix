import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key});

  final List<String> loanType = [
    'Personal Loan',
    'Home Loan',
    'Car/Bike Loan',
    'Mortgage Loan',
    'Education Loan',
    'Business Loan',
    'Gold Loan',
    'Health Loan',
    '+ More',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: loanType.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (c, i) {
            return Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              color: kBlueColor,
              margin: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  loanType[i],
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kWhiteColor),
                  textAlign: TextAlign.center,
                )),
              ),
            );
          }),
    );
  }
}
