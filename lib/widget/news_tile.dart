import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import '../models/article_model.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(articleModel.articleUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${articleModel.articleUrl}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: GestureDetector(
            onTap: _launchURL,
            child: Image.network(
              articleModel.image ??
                  'https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1m5siG.img?w=768&h=432&m=6&x=285&y=157&s=226&d=226',
              // articleModel.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          articleModel.title,
          // articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          articleModel.subTitle ?? ' ',
          // articleModel.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
