import 'package:animationexample/consts/colors.dart';
import 'package:animationexample/general_datas.dart';
import 'package:animationexample/widgets/menu_container_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/double_text_with_row_widget.dart';
import 'widgets/restaurant_card_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double topAnimatedContainerHeigth = 270;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                height: topAnimatedContainerHeigth,
                duration: const Duration(milliseconds: 500),
                child: ListView(
                  children: [
                    //top text location
                    Text(
                      "Location",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    //location icons
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.place_outlined),
                                Text("New York, Usa"),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 20,
                                ),
                              ],
                            ),
                            Icon(Icons.add_alert_outlined),
                          ]),
                    ),
                    //SearchBox
                    TextField(
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintStyle:
                            const TextStyle(decoration: TextDecoration.none),
                        filled: true,
                        fillColor: const Color(0xffedecec),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.circular(10), //border's color
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                        ),
                        hintText: "Search",
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            color: ProjectColors.goldenHour,
                            //Colors.yellow.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.circular(10), //border's color
                        ),
                      ),
                    ),
                    //Categories
                    const DoubleTextWithRowWidget(
                        titleOne: "Categories", titleTwo: "See all"),
                    //Menu Container
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: GeneralDatas.menuList.length,
                        itemBuilder: (context, index) {
                          return MenuContainerWidget(
                            index: index,
                            imageUrl: GeneralDatas.menuImageUrlList[index],
                            menuTitle: GeneralDatas.menuTitleList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //Text Near By restaurant
              const DoubleTextWithRowWidget(
                  titleOne: "Restaurants near by", titleTwo: "See all"),
              //restaurant place
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification is ScrollStartNotification &&
                        notification.metrics.atEdge &&
                        notification.metrics.pixels == 0.0) {
                      // ScrollView en üst kenarda başladı
                      setState(() {
                        topAnimatedContainerHeigth = 0;
                      });
                    }
                    else if (notification is ScrollUpdateNotification &&
                        notification.metrics.pixels == 0.0 &&
                        notification.metrics.axisDirection ==
                            AxisDirection.down) {
                      setState(() {
                        topAnimatedContainerHeigth = 270;
                      });
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: GeneralDatas.restaurants.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            index != (GeneralDatas.restaurants.length - 1)
                                ? const EdgeInsets.only(bottom: 10.0)
                                : EdgeInsets.zero,
                        child: RestaurantCardWidget(
                          imageUrl: GeneralDatas.restaurants[index].url,
                          starPoint:
                              GeneralDatas.restaurants[index].starPoint,
                          name: GeneralDatas.restaurants[index].name,
                          location: GeneralDatas.restaurants[index].location,
                          discount: GeneralDatas.restaurants[index].discount,
                          isThereDiscount:
                              GeneralDatas.restaurants[index].thereIsDiscount,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
NotificationListener<ScrollNotification>(
  onNotification: (scrollNotification) {
    if (scrollNotification is ScrollStartNotification &&
        scrollNotification.metrics.atEdge &&
        scrollNotification.metrics.pixels == 0.0) {
      // ScrollView en üst kenarda başladı
      // İşlev çağrılacak
    } else if (scrollNotification is ScrollEndNotification &&
               scrollNotification.metrics.extentAfter == 0.0) {
      // ScrollView sona ulaştı
      // İşlev çağrılacak
    }
    return false;
  },
  child: SingleChildScrollView(
    // ScrollView burada olacak
  ),
)

Bu kodda, NotificationListener Widget'ı kullanılarak ScrollStartNotification ve ScrollEndNotification türleri
dinlenir. onNotification işlevi, ScrollView'nin başladığı ve en üst kenara geldiği durumda veya ScrollView'nin
 sonuna ulaştığı durumda çağrılır. metrics.atEdge özelliği, ScrollView'nin kenarında olup olmadığını kontrol eder.
  metrics.pixels özelliği, ScrollView'nin hangi pikselinde olduğunu verir. metrics.extentAfter özelliği,
  ScrollView'nin sonuna kadar kalan piksel miktarını verir.

Eğer ScrollStartNotification türü olduğunda, metrics.atEdge özelliği ve metrics.pixels == 0.0 ifadesi doğruysa,
ScrollView'nin başladığı ve en üst kenara geldiği durumda belirtilen işlev çağrılır. Eğer ScrollEndNotification
türü olduğunda, metrics.extentAfter özelliği 0 ise, ScrollView'nin sonuna ulaşıldığı durumda belirtilen işlev
çağrılır.

Bu şekilde, hem ScrollView'nin başladığı ve en üst kenara geldiği durumda hem de ScrollView'nin sonuna ulaştığı
 durumda belirli işlevleri çağırabilirsiniz.


 Bu kodda, yeni eklenen if bloğu, geri yukarı çıktığınızda çağrılacak işlevi belirtir. ScrollUpdateNotification
  türü dinlenir, ancak yalnızca pixels özelliği sıfıra eşit olduğunda ve axisDirection özelliği
  AxisDirection.down olarak ayarlandığında geri yukarı çıkıldığı anlaşılır. Bu durumda, belirtilen işlev çağrılır.
 */
