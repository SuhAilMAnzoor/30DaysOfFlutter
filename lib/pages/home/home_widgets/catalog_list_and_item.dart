import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog_model.dart';
import 'package:flutter_catalog/pages/home/home_detail_page.dart';
import 'package:flutter_catalog/pages/home/home_widgets/catalog_image.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0), // same as .py16()
      child: Container(
        height: 120, // same as .square(100)
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white, // same as .white
          borderRadius: BorderRadius.circular(12), // same as .roundedLg
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    catalog.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: MyTheme.darkBluishColor,
                    ),
                  ),
                  Text(
                    catalog.desc,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        Text(
                          "\$${catalog.price.toString()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor,
                            ),
                            shape: MaterialStateProperty.all(
                              const StadiumBorder(),
                            ),
                          ),
                          child: Text(
                            "Buy",
                            style: TextStyle(color: MyTheme.creamColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
