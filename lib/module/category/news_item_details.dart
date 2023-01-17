import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemDetails extends StatelessWidget {
  static const String routeName = 'NewsItemDetails';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;
    return Stack(
      children: [
        Image.asset(
          'assets/images/image.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.newsDetails,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  height: 230,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    args.urlToImage ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  args.author ?? '',
                  style: const TextStyle(
                    color: Color(0xff79828B),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  args.title ?? '',
                  style: const TextStyle(
                    color: Color(0xff42505C),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  args.publishedAt?.substring(0, 10) ?? '',
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Color(0xffA3A3A3),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  args.description ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        var url = Uri.parse(args.url ?? '');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: const Text(
                        'View Full Article',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_right,
                      size: 40,
                    )
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
