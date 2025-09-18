import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_union_test/src/core/app_asset.dart';
import 'package:flutter/material.dart';

import '../../../core/app_text_style.dart';
import '../../../data/model/response.dart';

class StockTile extends StatelessWidget {
  final StockData data;

  const StockTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: data.logo,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
              errorWidget: (_, _, _) {
                return SizedBox();
              },
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    data.tradingSymbol,
                    style: AppTextStyle.medium.copyWith(fontSize: 16),
                  ),
                  const SizedBox(width: 4),
                  Image.asset(
                    width: 20,
                    height: 20,
                    data.isCompliant
                        ? AppAssets.compliant
                        : AppAssets.noncompliant,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                data.companyName,
                style: AppTextStyle.regular.copyWith(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${data.price.price.toString()} ${data.currency}",
                style: AppTextStyle.regular.copyWith(
                  fontSize: 16,
                 ),
              ),
              const SizedBox(height: 4),
              Text(data.price.changePercent.toString(),
                style: AppTextStyle.regular.copyWith(
                  fontSize: 14,
                  color: AppTextStyle.getPercentColor(data.price.changePercent)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

