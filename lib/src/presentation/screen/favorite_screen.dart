import 'package:flutter/material.dart';
import 'package:office_furniture/core/app_style.dart';
import 'package:office_furniture/src/business_logic/provider/furniture_provider.dart';
import 'package:office_furniture/src/data/model/furniture.dart';
import 'package:office_furniture/src/presentation/widget/empty_widget.dart';
import 'package:office_furniture/src/presentation/widget/furniture_list_view.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Furniture> favoriteList = context.watch<FurnitureProvider>().getFavoriteList;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              favoriteList.isNotEmpty
                  ? FurnitureListView(
                      isHorizontal: false,
                      furnitureList: favoriteList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Empty favorite",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
