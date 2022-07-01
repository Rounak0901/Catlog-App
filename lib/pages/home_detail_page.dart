import 'package:flutter/material.dart';
import 'package:my_app/models/catlog.dart';
import 'package:my_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: context.theme.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.xl4.color(context.accentColor).bold.make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam nulla nisl, varius eget facilisis ut, egestas id urna. Etiam accumsan enim at lectus tincidunt placerat. Nunc condimentum eros hendrerit velit tincidunt elementum. Morbi interdum gravida interdum. Proin et consectetur sem. Donec dolor mi, congue eu imperdiet sit amet, porta id leo. Integer elit sapien, vulputate sit amet massa sed, posuere molestie ligula. Aenean auctor aliquet ullamcorper. Sed efficitur leo egestas dignissim porttitor."
                      .text
                      .textStyle(context.captionStyle)
                      .medium
                      .center
                      .make()
                      .p16()
                ],
              ).py64(),
            ),
          ))
        ]),
      ),
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to Cart".text.xl.make(),
            ).wh(140, 45)
          ],
        ).p32(),
      ),
    );
  }
}
