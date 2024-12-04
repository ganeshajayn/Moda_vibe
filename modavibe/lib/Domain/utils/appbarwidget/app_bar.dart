import 'package:flutter/material.dart';

class Appbarwidget extends StatelessWidget {
  const Appbarwidget(
      {super.key,
      required this.tittle,
      required this.centretitle,
      required this.backgroundcolor,
      // this.theme,
      this.foregroundcolor,
      this.leading,
      this.elevation,
      this.actions,
      this.icontheme,
      this.actionicon});
  final Widget tittle;
  final bool centretitle;
  final Color backgroundcolor;
  final Color? foregroundcolor;
  final double? elevation;
  final List<Widget>? actions;
  final IconThemeData? icontheme;
  final IconThemeData? actionicon;
  final Widget? leading;
  //final ThemeData? theme;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: tittle,
      centerTitle: centretitle,
      backgroundColor: backgroundcolor,
      foregroundColor: foregroundcolor,
      elevation: elevation,
      actions: actions,
      leading: leading,
      actionsIconTheme: actionicon,
      iconTheme: icontheme,
    );
  }
}
