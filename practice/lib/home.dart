import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildIconButton(IconData icon, String categorieName) {
    return IntrinsicWidth(
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent, // pas de fond
              shadowColor: Colors.transparent, // pas d’ombre
              elevation: 0, // pas d’élévation
              surfaceTintColor:
                  Colors.transparent, // supprime le gris sur certains thèmes
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    0), // bord droit (ou change si besoin)
                side: BorderSide.none,
              ), // pas de bordure
              padding: const EdgeInsets.all(10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 50,
                ),
                const SizedBox(height: 4),
                Text(
                  categorieName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLastOrder(String imagePath, String kitchenName, int itemCount,
      int daysDifference, description) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: const Color.fromARGB(255, 247, 236, 236),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.blue,
                height: 150,
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        kitchenName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text("4.8")
                    ],
                  ),
                  Text("$itemCount plats - Il y a $daysDifference jours"),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text("1 burgers américain")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  static const _categorieName = <String>[
    "Favorites",
    "Pickup",
    "Grocery",
    "Top Eats",
    "Deals",
    "Special Offer",
    "Week Offer",
    "Best of the month"
  ];

  static const _iconTypes = <IconData>[
    Icons.favorite_border_rounded,
    Icons.shopping_bag,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
    Icons.auto_awesome_motion,
    Icons.auto_awesome_motion,
    Icons.star_border, // ← ajoute celui-ci pour égaliser
  ];
  static const _lastOrderImage = <String>[
    'ubereatrestaurantpic.png',
    'ubereatrestaurantpic.png',
    'ubereatrestaurantpic.png',
    'ubereatrestaurantpic.png',
  ];
  static const _lastOrderRestaurantName = <String>[
    "Kfc",
    "Mcdonalds",
    "Burger Kings",
    "Chez Ronnie"
  ];
  static final _lastOrderDate = <DateTime>[
    DateTime(2025, 7, 8, 13, 05),
    DateTime(2025, 7, 7, 13, 05),
    DateTime(2025, 7, 6, 13, 05),
    DateTime(2025, 7, 5, 13, 05),
  ];

  int calculTimeSpend(DateTime oldestDate) {
    DateTime now = DateTime.now();
    Duration timeSpendBetween = oldestDate.difference(now).abs();
    return timeSpendBetween.inDays;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    "Delivery",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    "Pickup",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            //END ROW DELIVERY PICK UP BUTTON
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200]),
                  width: double.infinity,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100]),
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_sharp),
                        label: const Text("123 Main St"),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[100]),
                        onPressed: () {},
                        icon: const Icon(Icons.history_rounded),
                        label: const Text("Now ⭣"),
                      )
                    ],
                  ),
                )), // END PADDING ADRESS
            const SizedBox(height: 10),
            const Image(image: AssetImage('ubereatpromotion.png')),
            //END PROMOTION PICTURE
            const SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: _iconTypes.length,
              itemBuilder: (context, index, realIdx) {
                return _buildIconButton(
                    _iconTypes[index], _categorieName[index]);
              },
              options: CarouselOptions(
                viewportFraction: 0.28, // 👈 4 éléments visibles

                height: 100,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                scrollPhysics: const BouncingScrollPhysics(),
                padEnds:
                    false, // ✅ Désactive le padding automatique aux extrémités
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Again",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all >",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //'ubereatpromotion.png'
            CarouselSlider.builder(
              itemCount: 4,
              itemBuilder: (context, index, realIdx) {
                return _buildLastOrder(
                    _lastOrderImage[index],
                    _lastOrderRestaurantName[index],
                    4,
                    calculTimeSpend(_lastOrderDate[index]),
                    "description");
              },
              options: CarouselOptions(
                viewportFraction: 0.8, // 👈 4 éléments visibles

                height: 100,
                enableInfiniteScroll: false,
                enlargeCenterPage: false,
                scrollPhysics: const BouncingScrollPhysics(),
                padEnds:
                    false, // ✅ Désactive le padding automatique aux extrémités
              ),
            )
          ],
        ),
      ),
    );
  }
}
