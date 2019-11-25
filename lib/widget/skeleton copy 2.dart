import 'package:flutter/material.dart';

class FlumSkeleton extends StatefulWidget {
  Widget child;
  final Color shimmerColor;
  final Color gradientColor;
  final Curve curve;

  FlumSkeleton({
    this.child,
    this.shimmerColor = Colors.black26,
    this.gradientColor = Colors.black12,
    this.curve = Curves.fastOutSlowIn,
    Key key
  }) : super(key: key);

  @override
  _FlumSkeletonState createState() => _FlumSkeletonState();
}

class _FlumSkeletonState extends State<FlumSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _gradientPosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _gradientPosition = Tween<double>(
      begin: -3,
      end: 10,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear
      ),
    )..addListener(() {
      setState(() {});
    });

    _controller.repeat()?.orCancel;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (widget.child == null) {
    //   widget.child = Container(
    //     height: 10.0,
    //   );
    // }

    return Container(
      child: widget.child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(_gradientPosition.value, 0),
          end: Alignment(-1, 0),
          colors: [
            widget.gradientColor,
            widget.shimmerColor,
            widget.gradientColor,
          ]
        )
      ),
    );
  }
}