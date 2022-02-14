import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            //color: Colors.grey,
            height: 60,
            alignment: Alignment.bottomCenter,
            child: FooterTabs(),
          ),
          //CircleButton(),
        ],
      ),
    );
  }
}

class FooterTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TabsWidget(),
        CircleButton(),
      ],
    );
  }
}

class TabsWidget extends StatelessWidget {
  const TabsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              height: 50,
              color: Colors.blue,
              child: Center(
                child: Text('Tab 1 2'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              color: Colors.blue,
              child: Center(
                child: Text('Tab 2'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
  }) : super(key: key);
  final _padding = 10;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            alignment: Alignment.center,
            //height: MediaQuery.of(context).size.height - _padding,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,

            //height: MediaQuery.of(context).size.height - _padding,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 3,
              ),
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
