import 'package:flutter/material.dart';
import 'package:vs_gg/capturecarte.dart';
import 'package:vs_gg/framecarte.dart';
import 'package:vs_gg/infocarte.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:vs_gg/more_info/select_background.dart';

class SelectColor extends StatefulWidget {
  const SelectColor(
      {Key? key, required this.cardData, required this.background})
      : super(key: key);

  final CardData cardData;
  final dynamic background;

  @override
  State<SelectColor> createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  Map colorData = {
    'textColor': Colors.black,
    'boxColor': Colors.white,
    'boxTextColor': Colors.black
  };

  Color pickerColor = Colors.white;

  colorDialog(BuildContext context, String target) {
    pickerColor = colorData[target];
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selectionne une couleur !'),
          content: SingleChildScrollView(
            child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: (color) => {
                      setState(() => {pickerColor = color})
                    }),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Ok'),
              onPressed: () {
                setState(() => colorData[target] = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'TextColor',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorData['textColor'])),
                  child: Container(),
                  onPressed: () {
                    colorDialog(context, 'textColor');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'boxColor',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorData['boxColor'])),
                  child: Container(),
                  onPressed: () {
                    colorDialog(context, 'boxColor');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'boxTextColor',
                  style: TextStyle(
                    fontFamily: 'normal',
                    fontSize: width * 0.075,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          colorData['boxTextColor'])),
                  child: Container(),
                  onPressed: () {
                    colorDialog(context, 'boxTextColor');
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => {Navigator.pop(context)},
                    style: ElevatedButton.styleFrom(minimumSize: Size(80, 40)),
                    child: Container(
                      child: Text('Quitter'),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CardCapture(CardFrame(
                                  cardData: widget.cardData,
                                  background: widget.background,
                                  colorData: colorData))))
                    },
                    style: ElevatedButton.styleFrom(minimumSize: Size(80, 40)),
                    child: Container(
                      child: Text('Entrer'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
