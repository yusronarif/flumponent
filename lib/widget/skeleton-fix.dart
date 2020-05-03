import 'package:flutter/material.dart';

class FlumSkeleton extends StatefulWidget {
  final Widget child;
  final Color shimmerColor;
  final Color gradientColor;
  final Border border;
  final BorderRadius borderRadius;
  final double width;
  final double height;

  FlumSkeleton({
    Key key,
    this.child,
    this.width,
    this.height = 10.0,
    this.shimmerColor = Colors.black26,
    this.gradientColor = Colors.black12,
    this.border,
    this.borderRadius,
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
    return Container(
      width: widget.child!=null ? null : widget.width,
      height: widget.child!=null ? null : widget.height,
      child: widget.child,
      decoration: BoxDecoration(
        border: widget.border,
        borderRadius: widget.borderRadius,
        gradient: LinearGradient(
          begin: Alignment(_gradientPosition.value, 0),
          end: Alignment(-1, 0),
          colors: [widget.gradientColor, widget.shimmerColor, widget.gradientColor],
        )
      ),
    );
  }
}