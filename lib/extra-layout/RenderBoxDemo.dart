import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.orange[100],
          child: render_box(
            distance: 18.0,
            child: FlutterLogo(
              size: 300,
            ),
          ),
        ),
        Container(
          color: Colors.blue[100],
          child: render_box(
            distance: 40.0,
            child: Icon(Icons.category, size: 80),
          ),
        )
      ],
    );
  }
}

class render_box extends SingleChildRenderObjectWidget {
  final double distance;

  render_box({Widget child, this.distance}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    //return rrender_box(distance);
    return rrrender_box(distance);
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    //(renderObject as rrender_box).distance = distance;
    (renderObject as rrrender_box).distance = distance;
  }
}

class rrender_box extends RenderBox with RenderObjectWithChildMixin {
  double distance;

  rrender_box(this.distance);

  @override
  void performLayout() {
    child.layout(constraints, parentUsesSize: true);
    size = (child as RenderBox).size;
    print(size);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    print(offset);
    context.paintChild(child, offset);
    // Get a canvas from the context.
    // context.canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint)
    context.pushOpacity(offset, 125, (context, offset) {
      // The offset doesn't contain the second Parameter's offset.
      print(offset);
      context.paintChild(child, Offset(distance, distance));
    });
  }
}

class rrrender_box extends RenderProxyBox with DebugOverflowIndicatorMixin {
  double distance;

  rrrender_box(this.distance);

  @override
  void paint(PaintingContext context, Offset offset) {
    print(offset);
    context.paintChild(child, offset);
    // Get a canvas from the context.
    // context.canvas.drawAtlas(atlas, transforms, rects, colors, blendMode, cullRect, paint)
    context.pushOpacity(offset, 125, (context, offset) {
      // The offset doesn't contain the second Parameter's offset.
      print(offset);
      context.paintChild(child, Offset(distance, distance));
    });

    paintOverflowIndicator(
      context,
      offset,
      // Offset.zero & size == Rect.fromLTWH(0, 0, size.width, size.height)
      offset & size,
      offset & child.size,
      //Rect.fromLTWH(0, 0, size.width, size.height),
      //Rect.fromLTWH(0, 0, size.width+10, size.height+10),
    );
  }
}
