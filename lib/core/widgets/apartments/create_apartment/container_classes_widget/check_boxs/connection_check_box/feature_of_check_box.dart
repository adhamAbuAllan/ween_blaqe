
class FeatureOfCheckBox{
  int id;
  String name;
  String icon;
  bool checked = false;
  String  data ;
  FeatureOfCheckBox({
    required this.id,
    required this.name,
    required this.icon,
    this.checked=false,
      this.data = "data prameter is null!"
  });
}
