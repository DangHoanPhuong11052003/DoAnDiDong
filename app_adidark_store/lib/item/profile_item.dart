import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.sub = "",
    required this.onTap,
  });

  final IconData icon;
  final String title, sub;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 7),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 18, 10),
                    child:
                        Icon(icon, size: MediaQuery.of(context).size.width / 9),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontSize: 18),
                      ),
                      if (sub != "")
                        Text(
                          sub,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                    ],
                  )
                ],
              ),
              Icon(Icons.chevron_right_sharp,
                  size: MediaQuery.of(context).size.width / 9)
            ],
          ),
        ),
      ),
    );
  }
}
