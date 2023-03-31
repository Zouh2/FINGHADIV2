import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class menuprofileWidget extends StatelessWidget {
  const menuprofileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30 , height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFFFFEED3)
        ),
        child: Icon(icon, color: const Color(0xFF3F3D56),),
      ),
      title: Text(title,style: Theme.of(context).textTheme.bodyText1?.apply(color:textColor)),
      trailing: endIcon? Container(
          width: 30 , height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white60
          ),
          child: const Icon(LineAwesomeIcons.cog,color:Colors.white60)) :null,
    );
  }
}
