import 'package:medito/constants/colors/color_constants.dart';
import 'package:medito/constants/styles/widget_styles.dart';
import 'package:medito/routes/routes.dart';
import 'package:medito/utils/utils.dart';
import 'package:medito/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/home/home_model.dart';
import '../animated_scale_widget.dart';

class CarouselWidget extends ConsumerWidget {
  const CarouselWidget({super.key, required this.data});

  final List<HomeCarouselModel> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var titleStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontFamily: SourceSerif,
          color: ColorConstants.white,
          fontSize: 24,
        );
    var subtitleStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          fontFamily: DmSans,
          color: ColorConstants.white,
        );
    var size = MediaQuery.of(context).size;

    var boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          ColorConstants.black.withOpacity(0.0),
          ColorConstants.black.withOpacity(0.8),
        ],
        stops: const [0.3, 0.9],
      ),
    );

    var first = data.first;

    return AnimatedScaleWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding16),
        child: InkWell(
          onTap: () => handleNavigation(
            first.type,
            [first.path.toString().getIdFromPath(), first.path],
            context,
          ),
          child: Stack(
            children: [
              _buildCoverImage(size, first),
              Container(
                width: size.width,
                height: 200,
                decoration: boxDecoration,
                padding: const EdgeInsets.all(padding16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      first.title,
                      style: titleStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      first.subtitle,
                      style: subtitleStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect _buildCoverImage(Size size, HomeCarouselModel data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: SizedBox(
        width: size.width,
        height: 200,
        child: NetworkImageWidget(
          url: data.coverUrl,
        ),
      ),
    );
  }
}
