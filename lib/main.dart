import 'package:flutter/cupertino.dart';

void main() => runApp(Cupertino());

class Cupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          navLargeTitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: CupertinoColors.activeBlue
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            title: Text('Articles')
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            title: Text('Views')
          )
        ],
      ),
      tabBuilder: (context,i){
        return CupertinoTabView(
          builder: (context){
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: (i == 0) ? Text('Articles') : Text('Views'),
              ),
              child: Center(
                child: CupertinoButton(
                child: Text(
                  'This is a tab #$i',
                   style: CupertinoTheme.of(context)
                   .textTheme
                   .actionTextStyle
                   .copyWith(fontSize: 32) 
                ),
                onPressed: () {
                  Navigator.of(context).push(
                   CupertinoPageRoute(builder: (context){
                     return DetailScreen(i == 0 ? 'Articles' : 'Views');
                   }),
                  );
                },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen(this.topic);
  final String topic;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Details'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('A switch'),
                  ),
                  CupertinoSwitch(
                      value: switchValue,
                      onChanged: (value) {
                    setState(() => switchValue = value);
                  },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}