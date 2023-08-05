import 'package:carousel_slider/carousel_slider.dart';
import 'package:credix/features/home_page/widgets/card_widget.dart';
import 'package:credix/shared/common_wave_widget.dart';
import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final useCarousel = useState<int>(0);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Lobby',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: kWhiteColor),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    kSizedBoxHeight(16.0),
                    CarouselSlider.builder(
                        itemCount: 4,
                        itemBuilder: (ctx, index, realIdx) {
                          return Image.asset(
                            '$kAssetImagePath/loan.jpg',
                            fit: BoxFit.fitWidth,
                          );
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 1,
                            onPageChanged: (i, r) => useCarousel.value = i)),
                    kSizedBoxHeight(8.0),
                    AnimatedSmoothIndicator(
                      count: 4,
                      activeIndex: useCarousel.value,
                      effect: const WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: kBlueColor,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                    ),
                    kSizedBoxHeight(24.0),
                    CardWidget(),
                    kSizedBoxHeight(24.0),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const CommonWaveWidget(),
                  ]),
            ),
          ]),
        ));
  }
}
