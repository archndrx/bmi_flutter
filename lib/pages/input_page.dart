import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/provider/input_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColour = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InputPageProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Consumer<InputPageProvider>(
                      builder: (context, cardProvider, _) {
                    return GestureDetector(
                      onTap: () {
                        cardProvider.updateColor(1);
                      },
                      child: ReusableCard(
                        colour: provider.maleCardColor,
                        cardChild: const IconContent(
                          text: 'MALE',
                          icon: FontAwesomeIcons.mars,
                        ),
                      ),
                    );
                  }),
                ),
                Expanded(
                  child: Consumer<InputPageProvider>(
                      builder: (context, cardProvider, _) {
                    return GestureDetector(
                      onTap: () {
                        cardProvider.updateColor(0);
                      },
                      child: ReusableCard(
                        colour: provider.femaleCardColor,
                        cardChild: const IconContent(
                          text: 'FEMALE',
                          icon: FontAwesomeIcons.venus,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(
              colour: activeCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
