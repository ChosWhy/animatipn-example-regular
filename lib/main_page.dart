import 'package:animationexample/consts/sizes.dart';
import 'package:animationexample/extensions/text_theme_extension.dart';
import 'package:animationexample/general_datas.dart';
import 'package:animationexample/state_manage/main_page_state_manage.dart';
import 'package:animationexample/widgets/menu_container_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/double_text_with_row_widget.dart';
import 'widgets/restaurant_card_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends MainPageStateManage with _MainPageUtility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: paddings.generalScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topAnimatedContainer(context),
              //Text Near By restaurant
              DoubleTextWithRowWidget(
                  titleOne: restaurantTitle, titleTwo: seeAllTitle),
              //restaurant place
              _restaurantListView(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _restaurantListView() {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: _onNotificationFunction,
        child: ListView.builder(
          itemCount: GeneralDatas.restaurants.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index != (GeneralDatas.restaurants.length - 1)
                  ? paddings.generalSmallBottomPadding
                  : EdgeInsets.zero,
              child: RestaurantCardWidget(
                imageUrl: GeneralDatas.restaurants[index].url,
                starPoint: GeneralDatas.restaurants[index].starPoint,
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
    );
  }

  bool _onNotificationFunction(ScrollNotification notification) {
    if (notification is ScrollStartNotification &&
        notification.metrics.atEdge &&
        notification.metrics.pixels == ProjectSizes.kZero) {
      // ScrollView en üst kenarda başladı
      setState(() {
        topAnimatedContainerHeigth = ProjectSizes.kZero;
      });
    } else if (notification is ScrollUpdateNotification &&
        notification.metrics.pixels == ProjectSizes.kZero &&
        notification.metrics.axisDirection == AxisDirection.down) {
      setState(() {
        topAnimatedContainerHeigth = 270;
      });
    }
    return false;
  }

  AnimatedContainer _topAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      height: topAnimatedContainerHeigth,
      duration: halfSecondDuration,
      child: ListView(
        children: [
          //top text location
          Text(
            locationTitle,
            style: context.textTheme().titleMedium,
          ),
          //location icons
          Padding(
            padding: paddings.generalSmallSymmetricVerticalPadding,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icons.placeIcon),
                      Text(restaurantLocationTitle),
                      Icon(
                        icons.keyboardArrowIcon,
                        size: iconSizes.xxxSmallIconSize,
                      ),
                    ],
                  ),
                  Icon(icons.addAlertIcon),
                ]),
          ),
          //SearchBox
          TextField(
            textAlignVertical: TextAlignVertical.center,
            maxLines: ProjectSizes.kOne,
            cursorColor: colors.black,
            decoration: InputDecoration(
              hintStyle: const TextStyle(decoration: TextDecoration.none),
              filled: true,
              fillColor: colors.coronation,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: colors.white),
                borderRadius: borderRadii
                    .generalNormalBorderRadiusCircular, //border's color
              ),
              contentPadding: paddings.generalSmallSymmetricVerticalPadding,
              prefixIcon: Icon(
                icons.searchIcon,
                color: colors.black,
              ),
              hintText: searchTitle,
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: colors.goldenHour,
                  //Colors.yellow.withOpacity(0.3),
                  borderRadius: borderRadii.generalNormalBorderRadiusCircular,
                ),
                child: Icon(
                  icons.filterIcon,
                  size: iconSizes.xSmallIconSize,
                  color: colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colors.white),
                borderRadius: borderRadii
                    .generalNormalBorderRadiusCircular, //border's color
              ),
            ),
          ),
          //Categories
          DoubleTextWithRowWidget(
              titleOne: categoriesTitle, titleTwo: seeAllTitle),
          //Menu Container
          SizedBox(
            height: listViewHeight,
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
    );
  }
}
mixin _MainPageUtility {
  final String restaurantTitle = "Restaurants near by";
  final String seeAllTitle = "See all";
  final Duration halfSecondDuration = const Duration(milliseconds: 500);
  final String locationTitle = "Location";
  final String restaurantLocationTitle = "New York, Usa";
  final String searchTitle = "Search";
  final String categoriesTitle = "Categories";
  final double listViewHeight = 110;
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
