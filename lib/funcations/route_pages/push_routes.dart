import 'package:flutter/material.dart';
//push to another page
myPush(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ));
}
//push and replace current screen
myPushReplace(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) {
        return page;
      },
      settings: RouteSettings(name: routeName)));


}
//push and remove all screen until first screen
myPushAndRemoveUntilIsFirst(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ),(route) =>route.isFirst ,);
}
//push and remove all screen until current screen
myPushAndRemoveUntilIsCurrent(BuildContext context, Widget page, String routeName) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
    builder: (ctx) {
      return page;
    },
    settings: RouteSettings(name: routeName),
  ),(route) =>route.isCurrent ,);
}
//push and remove until screen is active
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
  ), (route) => route.settings.name == routeName,);
}

myPushName(BuildContext context ,String routeName) {
  Navigator.of(context).pushNamed(routeName);
}
/*
//remove all the routes until screen you chosen
Ongoing gestures within the current route are canceled when a new route is pushed.
 */
myPushNameAndRemoveUntil(BuildContext context ,String routeName,RoutePredicate predicate,
String predicateRouteName ) {
  if(predicateRouteName==""){
    Navigator.of(context).pushNamedAndRemoveUntil(routeName,
            (Route<dynamic> route) =>
        false);
  }else {
    Navigator.of(context).pushNamedAndRemoveUntil(routeName,
            (Route<dynamic> route) =>
        route.settings.name == predicateRouteName);
  }
}
//push and replacement Named
myPushReplacementNamed(BuildContext context ,String routeName) {
  Navigator.of(context).pushReplacementNamed(routeName);
}

