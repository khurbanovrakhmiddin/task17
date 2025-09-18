import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/model/response.dart';

class StockTile extends StatelessWidget {
  final StockData data;

  const StockTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: data.logo,
              width: 40,height: 40,
              fit: BoxFit.contain,
              errorWidget: (_, _, _) {
                return SizedBox();
              },
            ),
          ),
          Column(children: [
            Row(children: [Text(data.tradingSymbol),Icon(Icons.add)],),
            Text(data.companyName)
          ],)
        ],
      ),
    );
  }
}
