import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

import '../const/regions.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final OnRegionTap onRegionTap;
  final String selectedRegion;

  const MainDrawer({
    required this.onRegionTap,
    required this.selectedRegion,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              '지역선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          ...regions
              .map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () {
                    onRegionTap(e);
                  },
                  tileColor: Colors.white,
                  selectedColor: Colors.black,
                  selectedTileColor: lightColor,
                  selected: e == selectedRegion,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
