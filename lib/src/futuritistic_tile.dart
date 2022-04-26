import 'package:flutter/material.dart';

class FuturisticTile<T> extends StatefulWidget {
  FuturisticTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.onLongTap,
    this.padding,
    this.margin,
    this.leading,
    this.trailing,
    this.color,
    this.decoration,
  });
  double? width = double.infinity;
  double? height = 65;
  Widget title;
  Widget? subtitle;
  Function? onTap;
  Function? onLongTap;
  EdgeInsetsGeometry? padding = const EdgeInsets.all(4);
  EdgeInsetsGeometry? margin = const EdgeInsets.all(4);
  Widget? leading;
  Widget? trailing;
  Color? color;
  BoxDecoration? decoration;

  @override
  _FuturisticTileState createState() => _FuturisticTileState();
}

class _FuturisticTileState<T> extends State<FuturisticTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      decoration: widget.decoration != null
          ? widget.decoration
          : BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20.0),
            ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 12,
            ),
            widget.leading != null
                ? SizedBox(
                    height: double.infinity,
                    child: widget.leading,
                  )
                : const SizedBox(),
            Expanded(
                child: SizedBox(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 15,
                ),
                child: widget.subtitle != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: widget.title,
                            flex: 2,
                          ),
                          Expanded(
                            child: FittedBox(
                              child: widget.subtitle,
                              fit: BoxFit.scaleDown,
                            ),
                            flex: 1,
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [widget.title],
                      ),
              ),
            )),
            widget.trailing != null
                ? SizedBox(
                    height: double.infinity,
                    child: widget.trailing,
                  )
                : const SizedBox(),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
        onTap: () => widget.onTap,
        onLongPress: () => widget.onLongTap,
      ),
    );
  }
}
