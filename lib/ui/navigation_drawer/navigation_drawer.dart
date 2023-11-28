
import 'package:flutter/material.dart';
import '../../res/app_context_extension.dart';
import '../../ui/navigation_drawer/navigation_action.dart';

class MyAppNavigationDrawer extends StatelessWidget {

  final Function(NavigationAction) countryMenuClick;

  const MyAppNavigationDrawer({required this.countryMenuClick, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _createDrawerHeader(context),
                _createDrawerBodyItem(context, icon: Icons.language, text: context.resources.strings!.menuCountry, onTap: countryMenuClick, action: NavigationAction.country),
                _expendedLanguageDrawerBody(context, onTap: countryMenuClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerHeader(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(context.resources.drawable.imgBgDrawerHeader)
            )
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: context.resources.color.colorAccent,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(context.resources.dimension.defaultMargin,context.resources.dimension.verySmallMargin,context.resources.dimension.verySmallMargin,context.resources.dimension.verySmallMargin),
                        child: Text(
                          "marajhussain75@gmail.com",
                          style: context.resources.style.drawerTextStyle,
                        ),
                      )
                  )
              ),
            ]
        )
    );
  }

  Widget _createDrawerBodyItem(BuildContext context, {required IconData icon, required String text, required Function(NavigationAction) onTap, required NavigationAction action}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: context.resources.dimension.smallMargin),
            child: Text(text, style: context.resources.style.drawerTextStyle,),
          )
        ],
      ),
      onTap: () => onTap(action),
    );
  }

  Widget _createExpandDrawerChildBodyItem(BuildContext context, {required String text, required Function(NavigationAction) onTap, required NavigationAction action}) {
    return ListTile(
      title: Text(text),
      onTap: () => onTap(action),
    );
  }

  Widget _expendedLanguageDrawerBody(BuildContext context, {required Function(NavigationAction) onTap}) {
    return ExpansionTile(
      //Transform used to remove space between title & icon
      title: Transform(
        transform: Matrix4.translationValues(-24, 0.0, 0.0),
        child: Text(context.resources.strings!.language, style: context.resources.style.drawerTextStyle,),
      ),
      leading: const Icon(Icons.list_rounded), //add icon
      childrenPadding: const EdgeInsets.only(left:34), //children padding
      children: [
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.lngEnglish, onTap: countryMenuClick, action: NavigationAction.lngEnglish),
        _createExpandDrawerChildBodyItem(context, text: context.resources.strings!.lngHindi, onTap: countryMenuClick, action: NavigationAction.lngHindi),
      ],
    );
  }
}
