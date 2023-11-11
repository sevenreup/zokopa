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
              height: 380,
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Upcoming events",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://www.malawitourism.com/wp-content/uploads/2019/07/Lake-Bvumbwe-1920x720.jpg",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Slow Jazz and Jams",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "12 July 2024",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontWeight: FontWeight.w200),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("View"),
                                Icon(
                                  Icons.chevron_right,
                                  size: 18,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: 4,
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
        width: 300,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              clipBehavior: Clip.hardEdge,
              height: 260,
              width: 300,
              child: CachedNetworkImage(
                imageUrl: location.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  child: Column(
                    children: [
                      IconButton.filled(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                      )
                    ],
                  ),
                )),
            Positioned(
              top: 220,
              right: 0,
              left: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).colorScheme.shadow.withOpacity(.2),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      location.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${location.description.substring(0, 30)}...",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant
                                .withOpacity(.6),
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant
                                  .withOpacity(.6),
                              size: 18,
                            ),
                            Text(
                              "Lilongwe",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant
                                        .withOpacity(.6),
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                          child: PeopleCard(),
                        )
                      ],
                    )
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

class PeopleCard extends StatelessWidget {
  const PeopleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      const double faceSize = 26;
      final facesCount = randomImages.length;

      double facePercentVisible = 1.0 - .5;
      final maxIntrinsicWidth = facesCount > 1
          ? (1 + (facePercentVisible * (facesCount - 1))) * faceSize
          : faceSize;

      late double leftOffset;
      if (maxIntrinsicWidth > constraints.maxWidth) {
        leftOffset = 0;
        facePercentVisible =
            ((constraints.maxWidth / faceSize) - 1) / (facesCount - 1);
      } else {
        leftOffset = (constraints.maxWidth - maxIntrinsicWidth) / 2;
      }

      if (constraints.maxWidth < faceSize) {
        // There isn't room for a single face. Show nothing.
        return const SizedBox();
      }

      return SizedBox(
        height: faceSize + 10,
        width: constraints.maxWidth,
        child: Stack(
          children: [
            for (var i = 0; i < facesCount; i += 1)
              Positioned(
                left: leftOffset + (i * facePercentVisible * faceSize),
                child: UserIcon(
                  imageUrl: randomImages[i],
                  size: faceSize,
                ),
              ),
            Positioned(
              left: leftOffset + (facesCount * facePercentVisible * faceSize),
              child: const UserIcon(
                count: 5,
                size: faceSize,
              ),
            )
          ],
        ),
      );
    });
  }
}

List randomImages = [
  'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
  'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
  'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
];

class UserIcon extends StatelessWidget {
  const UserIcon({
    super.key,
    this.imageUrl,
    this.count,
    this.size = 26,
  });
  final String? imageUrl;
  final int? count;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: Theme.of(context).colorScheme.surfaceVariant,
          width: 1,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      height: size,
      width: size,
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              height: size,
              width: size,
            )
          : Center(
              child: Text(count.toString()),
            ),
    );
  }
}
