import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildIconButton(IconData icon) {
    return Container(
      color: Colors.red,
      width: 70, //taille a regler
      margin: const EdgeInsets.all(8),
      height: 70, //same
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            const Text("Pickup", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  static const _iconTypes = <IconData>[
    Icons.shopping_bag,
    Icons.add_location_sharp,
    Icons.zoom_in_outlined,
    Icons.auto_awesome_motion,
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
              itemCount: (_iconTypes.length / 4).ceil(),
              itemBuilder: (context, index, realIdx) {
                final first = index * 4;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 4; i++)
                      if (first + i < _iconTypes.length)
                        _buildIconButton(_iconTypes[first + i]),
                  ],
                );
              },
              options: CarouselOptions(
                viewportFraction: 1.0,
                height: 100,
                enableInfiniteScroll: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
