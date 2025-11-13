import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog_model.dart';
import 'package:flutter_catalog/pages/home/home_detail_page.dart';
import 'package:flutter_catalog/pages/home/home_widgets/add_to_cart.dart';
import 'package:flutter_catalog/pages/home/home_widgets/catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key, required items});

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
            ),

            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    var children = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width < 600 ? 0 : 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                catalog.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Text(
                catalog.desc,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  Text(
                    "\$${catalog.price.toString()}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      // we make it a stateful widget so that's why we extract a new widget for this button
                      child: AddToCart(catalog: catalog),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Container(
        height: 130,
        width: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: MediaQuery.of(context).size.width < 600
            ? Row(children: children)
            : Column(children: children),
      ),
    );
  }
}
