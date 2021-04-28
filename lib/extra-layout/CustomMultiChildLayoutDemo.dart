import 'package:flutter/material.dart';

class CustomMultiChildLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[200],
      child: CustomMultiChildLayout(
        delegate: DelegateDemo(),
        children: <Widget>[
//        LayoutId(
//          id: 1,
//          child: FlutterLogo(
//            size: 200,
//          ),
//        ),
//        LayoutId(
//          id: 2,
//          child: FlutterLogo(),
//        ),
          LayoutId(
            id: 4,
            child: Container(color: Colors.grey),
          ),
          LayoutId(
            id: 3,
            child: Text("text",style: TextStyle(fontSize: 50),),
          ),
        ],
      ),
    );
  }
}

class DelegateDemo extends MultiChildLayoutDelegate {
  var size1, size2;

  @override
  void performLayout(Size size) {
    layout34(size);
    print(size);
    print(size1);
    print(size2);
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => true;

  @override
  Size getSize(BoxConstraints constraints) => Size(300,300);

  layout12(Size size) {
    if (hasChild(1)) {
//      size1 = layoutChild(1, BoxConstraints(minWidth: 0,maxWidth: 100,maxHeight: 100,minHeight: 0));
      size1 = layoutChild(1, BoxConstraints.loose(size));
      positionChild(1, Offset.zero);
    }
    if (hasChild(2)) {
      size2 = layoutChild(
          2,
          BoxConstraints(
              minHeight: 200, maxHeight: 200, maxWidth: 200, minWidth: 200));
      positionChild(2, Offset(size1.width, size1.height));
    }
  }

  layout34(Size size){
    final size3 = layoutChild(3, BoxConstraints.loose(size));
    // normal
    //positionChild(3, Offset.zero);
    // center
    final x = size.width/2-size3.width/2;
    final y = size.height/2-size3.height/2;
    positionChild(3, Offset(x,y));
    final size4 = layoutChild(4, BoxConstraints(
      minWidth: size3.width,maxWidth: size3.width,maxHeight: 2,minHeight: 2
    ));
    positionChild(4, Offset(x,size3.height+y));
  }
}
