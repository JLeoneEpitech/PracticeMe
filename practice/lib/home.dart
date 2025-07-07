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
            )
          ],
        ),
      ),
    );
  }
}
