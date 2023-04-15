import 'package:flutter/material.dart';

myPush(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ));
}
myPushReplace(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) {
        return page;
      },
      settings: RouteSettings(name: routeName)));


}
myPushAndRemoveUntilIsFirst(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ),(route) =>route.isFirst ,);
}
myPushAndRemoveUntilIsCurrent(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ),(route) =>route.isCurrent ,);
}
myPushAndRemoveUntilIsActive(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ),(route) =>route.isActive ,);
}
myPushAndRemoveUntilName(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ),(route) =>route.settings.name == routeName,);
}

