import 'package:flutter/material.dart';
import '../contants.dart' show AppTextStyle, AppColors;
import '../model/wechat_data.dart';

class Wechat extends StatelessWidget {
  
  const Wechat({Key key,this.conversation})
  :assert(conversation !=null);

  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(AppTextStyle.ListBgColor),
        border: Border(top: BorderSide(width: 1.0,color: Color(AppColors.AppBarColor))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image.asset(conversation.img,width: 50.0,height: 50.0,),
          ),
          Container(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(conversation.title,style: AppTextStyle.ListTileStyle,textDirection: TextDirection.rtl,),
                Text(conversation.text,style: AppTextStyle.ListTextColor,maxLines: 1,overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
          Column( 
            children: <Widget>[
              Text(conversation.time,style: AppTextStyle.ListTime,),
            ],
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
    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        return Wechat(conversation: mockConversations[index],);
      },
      itemCount: mockConversations.length,
    );
  }
}