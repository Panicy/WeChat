import 'package:flutter/material.dart';
import '../contants.dart' show AppTextStyle, AppColors,Constants;
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
          child: Text(conversation.mesnum.toString(),style:AppTextStyle.MesStyle),
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


    
    //消息免打扰
    

    var _notMes=<Widget>[
        Text(conversation.time,style: AppTextStyle.ListTime,),
        SizedBox(height: 10.0,),
    ];
    if(conversation.isMute){
      _notMes.add(
        Icon(
          IconData(
            0xe60e,
            fontFamily: Constants.IconFontFamily
          ),
          size: AppTextStyle.MuteIconSize,
          color: Color(AppTextStyle.MuteIconBg),
        )
      );
    }else{
      _notMes.add(
        Icon(
          IconData(
            0xe60e,
            fontFamily: Constants.IconFontFamily
          ),
          size: AppTextStyle.MuteIconSize,
          color:Colors.transparent,//透明颜色
        )
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
          Container(width: 10.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(conversation.title,style: AppTextStyle.ListTileStyle,),
                SizedBox(height: 8.0,),
                Text(conversation.text,style: AppTextStyle.ListTextColor,maxLines: 1,overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
          Column( 
            children:_notMes,
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
  final WechatData data=WechatData.mock();
  @override
  Widget build(BuildContext context) {
    var mockConversation=data.conversation;
    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        if(data.device != null){
          if(index==0 ){
                return _TopList(device: data.device,);
              }
          return Wechat(conversation:mockConversation[index-1]);
        }else{
          return Wechat(conversation:mockConversation[index]);
        }
        
      },
      itemCount: data.device!=null?mockConversation.length+1:mockConversation.length,
    );
  }
}


class _TopList extends StatelessWidget{
   const _TopList({  
      this.device,
    });

    final Device device;
    int get iconName{
      return device == Device.Win?0xe631:0xe641;
    }
    String get deviceName{
      return device == Device.Win? 'Windows': 'Mac';
    }
  @override
  Widget build(BuildContext context){
    return Container(
      color: Color(AppColors.AppBarColor),
      padding: EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 10.0),
          Icon(
            IconData(
              iconName,
              fontFamily: Constants.IconFontFamily
            ),
          ),
          SizedBox(width: 10.0),
         Text('$deviceName 已登录')
        ],
      ),
    );
  }
}