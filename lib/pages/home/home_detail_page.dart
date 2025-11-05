import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog_model.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                Text(
                  "\$${catalog.price.toString()}",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.red.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: MyTheme.creamColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: MyTheme.creamColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image, height: 300),
              ),
            ),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        Text(
                          catalog.name,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: MyTheme.darkBluishColor,
                          ),
                        ),
                        Text(
                          catalog.desc,
                          style: TextStyle(
                            fontSize: 16,

                            color: MyTheme.darkBluishColor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "asdjnsadkjsndjksandkjsandsjakdnsakjdnsajkdsjfisdfjdfisdufsdiufhsdiufhdsiufjdsfnjsfsdiufhdsiuhfiudshfiudshfdisufhsdiufhsdfiuhisdujdfdsiufhsdifusdjfoisdjfoisdjsddnasdkjsandkjnsadkjsandkjasdnksjcxjncic",
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
