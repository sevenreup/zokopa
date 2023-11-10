import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Lilongwe"),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              )
            ],
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Explore Lilongwe!",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 26,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Recommended places",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 16, top: 20),
              height: 320,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Location location = locations[index];
                  return LocationCard(
                    location: location,
                  );
                },
                itemCount: locations.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.location});
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 16),
        width: 360,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              clipBehavior: Clip.hardEdge,
              height: 260,
              width: 400,
              child: CachedNetworkImage(
                imageUrl: location.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 220,
              right: 0,
              left: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      location.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                    Text(
                      "${location.description.substring(0, 40)}...",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class Location {
  final String name;
  final String image;
  final String description;
  const Location({
    required this.name,
    required this.image,
    required this.description,
  });
}

List<Location> locations = [
  const Location(
    name: "Chimwenya Game Park",
    image:
        "https://www.malawitourism.com/wp-content/uploads/2019/07/Lake-Bvumbwe-1920x720.jpg",
    description:
        "Chimwenya Game Park is a serene, beautiful and privately owned 500 acre game park, home to the impressive Game Haven Lodge. The park is one of the last remaining indigenous forests and grasslands of the Shire Highlands of Southern Malawi. It lies at Bvumbwe, approximately 20 km south-east of Blantyre shortly before the Thyolo Tea Estates and on the way to Mount Mulanje.",
  ),
  const Location(
    name: "Chongoni Rock Art",
    image:
        "https://www.malawitourism.com/wp-content/uploads/2019/07/AdRockArt01-1920x720.jpg",
    description:
        "Chimwenya Game Park is a serene, beautiful and privately owned 500 acre game park, home to the impressive Game Haven Lodge. The park is one of the last remaining indigenous forests and grasslands of the Shire Highlands of Southern Malawi. It lies at Bvumbwe, approximately 20 km south-east of Blantyre shortly before the Thyolo Tea Estates and on the way to Mount Mulanje.",
  ),
  const Location(
    name: "Elephant Marsh",
    image:
        "https://www.malawitourism.com/wp-content/uploads/2019/07/elephant-marsh-1920x720.jpg",
    description:
        "Chimwenya Game Park is a serene, beautiful and privately owned 500 acre game park, home to the impressive Game Haven Lodge. The park is one of the last remaining indigenous forests and grasslands of the Shire Highlands of Southern Malawi. It lies at Bvumbwe, approximately 20 km south-east of Blantyre shortly before the Thyolo Tea Estates and on the way to Mount Mulanje.",
  ),
];
