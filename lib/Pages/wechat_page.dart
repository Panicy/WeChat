import 'package:flutter/material.dart';
import '../contants.dart' show AppTextStyle, AppColors;
import '../model/wechat_data.dart';

class Wechat extends StatelessWidget {
  
  const Wechat({Key key,this.conversation})
  :assert(conversation !=null);

  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    Widget img; //定义用户头像组件
    if(conversation.isAvatarFromNet()){
      img=Image.network(conversation.img,
        width: AppTextStyle.ListImgWidth,
        height: AppTextStyle.ListImgHeight,
      );
    }else{
      img=Image.asset(conversation.img,
         width: AppTextStyle.ListImgWidth,
        height: AppTextStyle.ListImgHeight,
        );
    }

    Widget imgNumWidgt;
    if(conversation.mesnum>=1 && conversation.mesnum<=99){
      //定义消息数量组件
        Widget mesNum=Container(
          height: AppTextStyle.MesWidth,
          width: AppTextStyle.MesWidth,
          alignment:Alignment.center,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(AppTextStyle.MesRadius),
            color: Color(AppTextStyle.MesBgColor)
          ),
          child: Text('99',style:AppTextStyle.MesStyle),
        );

        //消息与头像重叠
        imgNumWidgt=Stack(
          overflow: Overflow.visible,//超出 显示
          children: <Widget>[
            img,
            Positioned(
              right: -6.0,
              top: -6.0,
              child: mesNum,
            )
          ],
        );
    }else if(conversation.mesnum==0){
      imgNumWidgt=img;
    }else{
      imgNumWidgt=Stack(
          overflow: Overflow.visible,//超出 显示
          children: <Widget>[
            img,
            Positioned(
              right: -6.0,
              top: -6.0,
              child: Container(
                width: AppTextStyle.MesWidth/1.5,
                height: AppTextStyle.MesWidth/1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTextStyle.MesRadius),
                  color: Color(AppTextStyle.MesBgColor)
                ),
              ),
            )
          ],
        );
    }
    


    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(AppTextStyle.ListBgColor),
        border: Border(top: BorderSide(width: 1.0,color: Color(AppColors.AppBarColor))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          imgNumWidgt,
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