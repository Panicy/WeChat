import 'package:flutter/material.dart';


class wechat extends StatelessWidget {
  final Widget child;
  wechat({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('assets/images/ic_public_account.png',width: 50.0,),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('asddsasd',),
                Text('asddsasd'),
              ],
            ),
          ),
          Container(
            child: Text('昨天'),
            width: 50.0,
          )
        ],
      ),
    );
  }
}


class WeChatViewDemo extends StatefulWidget {
  final Widget child;

  WeChatViewDemo({Key key, this.child}) : super(key: key);

  _WeChatViewDemoState createState() => _WeChatViewDemoState();
}

class _WeChatViewDemoState extends State<WeChatViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: wechat(),
    );
  }
}