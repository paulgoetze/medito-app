import 'package:medito/constants/constants.dart';
import 'package:medito/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TrackCardWidget extends StatelessWidget {
  const TrackCardWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.coverUrlPath,
    this.onTap,
  });

  final String title;
  final String? subTitle;
  final String? coverUrlPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.onyx,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: subTitle != null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  _title(textTheme, title: title),
                  if (subTitle != null) height4,
                  _description(
                    textTheme,
                    subtitle: subTitle,
                  ),
                ],
              ),
            ),
            width12,
            _getCoverUrl(),
          ],
        ),
      ),
    );
  }

  Text _title(TextTheme textTheme, {required String title}) {
    return Text(
      title,
      style: textTheme.displayLarge?.copyWith(
        fontFamily: sourceSerif,
        height: 0,
      ),
    );
  }

  Widget _description(TextTheme textTheme, {String? subtitle}) {
    if (subtitle != null) {
      return Text(
        subtitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: textTheme.titleMedium?.copyWith(
          letterSpacing: 0,
          color: ColorConstants.graphite,
          fontSize: 14,
          height: 1.4,
        ),
      );
    }

    return const SizedBox();
  }

  Widget _getCoverUrl() {
    if (coverUrlPath != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: SizedBox(
          height: 80,
          width: 80,
          child: NetworkImageWidget(
            url: coverUrlPath ?? '',
            shouldCache: true,
          ),
        ),
      );
    }

    return const SizedBox();
  }
}
