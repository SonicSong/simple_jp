import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Start extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text('Text 1'),
    //         Text('Text 2'),
    //         Text('Text 3'),
    //       ],
    //     ),
    //   ),
    // );
    
    return CustomScrollView(scrollDirection: Axis.horizontal,
    slivers: [
      SliverList(delegate: SliverChildListDelegate.fixed([

      ]))
    ],);
  }
}


//constructor for "buttons" that would contain the phrases from QuestionsDB.db
class phraseButtonGet extends StatefulWidget {
  const phraseButtonGet({super.key});

  @override
  State<phraseButtonGet> createState() => _PhraseButtonGet();
}

class _PhraseButtonGet extends State<phraseButtonGet> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("BUTTON JP");
  }
}