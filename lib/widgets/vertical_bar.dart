import 'package:flutter/material.dart';

class VerticalBar extends StatefulWidget {
  const VerticalBar({
    Key? key,
    this.height,
    this.width,
    required this.percent,
    this.color,
    this.circularRadius,
    this.animationDuration,
    this.backGroundColor,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double percent;
  final Color? color;
  final Color? backGroundColor;
  final double? circularRadius;
  final Duration? animationDuration;

  @override
  State<VerticalBar> createState() => _VerticalBarState();
}

class _VerticalBarState extends State<VerticalBar> {
  double _height = 0;
  @override
  void initState() {
    super.initState();
    {
      Future.delayed(
          const Duration(seconds: 0),
          () => setState(
                () {
                  _height = widget.height != null
                      ? widget.percent * widget.height!
                      : widget.percent * 120;
                },
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: widget.height ?? 120,
          child: Stack(
            children: [
              Container(
                height: widget.height ?? 120,
                width: widget.width ?? 20,
                decoration: BoxDecoration(
                  color: widget.backGroundColor ?? Colors.red,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(widget.circularRadius ?? 20)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: widget.animationDuration ??
                      const Duration(
                        seconds: 0,
                      ),
                  width: widget.width ?? 20,
                  height: _height,
                  decoration: BoxDecoration(
                      color: widget.color ?? Colors.green,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(widget.circularRadius ?? 20))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
