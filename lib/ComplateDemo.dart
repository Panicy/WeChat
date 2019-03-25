import 'package:flutter/material.dart';
import './contants.dart';

class ListDemo extends StatelessWidget {

  const ListDemo({
    @required this.title,
    @required this.iconPath,
    @required this.onPressed,
    this.showDivider: false
  });

  final String title;
  final String iconPath;
  final bool showDivider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final _flabutton=Container(
          height: 50.0,
           child: Row(
              children: <Widget>[
                SizedBox(width: 10.0,),
                Image.asset(iconPath,width: 24.0,height: 24.0,),
                SizedBox(width: 10.0,),
                Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
        );
    
    final _borderFlabutton=Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0,color:Color(AppColors.AppBarColor)))
      ),
      child: _flabutton,
    );


    // return FlatButton(
    //       onPressed: onPressed,
    //       color: Colors.white,
    //       padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, this.showDivider?0.0:10.0),
    //       child:this.showDivider?_borderFlabutton: _flabutton
    //     );
    return FlatButton(
      onPressed: onPressed,
      color: Colors.white,
      child: this.showDivider?_borderFlabutton:_flabutton,
    );
  }
}