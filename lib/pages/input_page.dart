import 'package:bmi/pages/result_page.dart';
import 'package:bmi/provider/input_page_provider.dart';
import 'package:bmi/utils/components/bottom_button.dart';
import 'package:bmi/utils/components/icon_content.dart';
import 'package:bmi/utils/components/reusable_card.dart';
import 'package:bmi/utils/components/round_icon_button.dart';
import 'package:bmi/utils/constant.dart';

import 'package:bmi/utils/state/state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Consumer<InputPageProvider>(
                builder: (context, genderProvider, _) {
              return Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: genderProvider.selectedGender == GenderState.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: const IconContent(
                        text: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                      onPress: () {
                        genderProvider.updateGender(GenderState.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour:
                          genderProvider.selectedGender == GenderState.female
                              ? kActiveCardColour
                              : kInactiveCardColour,
                      cardChild: const IconContent(
                        text: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      ),
                      onPress: () {
                        genderProvider.updateGender(GenderState.female);
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
          Expanded(
            child: Consumer<InputPageProvider>(
                builder: (context, heightProvider, _) {
              return ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          heightProvider.height.toString(),
                          style: kNumberTextStyle,
                        ),
                        const Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kInactiveTrackColor,
                        thumbColor: kThumbColor,
                        overlayColor: kOverlayColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: heightProvider.height.toDouble(),
                        onChanged: (double newValue) {
                          heightProvider.updateHeight(newValue.round());
                        },
                        min: 120,
                        max: 220,
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
          Expanded(
            child: Consumer<InputPageProvider>(
                builder: (context, wageProvider, _) {
              return Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            wageProvider.weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  wageProvider
                                      .updateWeight(wageProvider.weight - 1);
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  wageProvider
                                      .updateWeight(wageProvider.weight + 1);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            wageProvider.age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  wageProvider.updateAge(wageProvider.age - 1);
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  wageProvider.updateAge(wageProvider.age + 1);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResultPage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
