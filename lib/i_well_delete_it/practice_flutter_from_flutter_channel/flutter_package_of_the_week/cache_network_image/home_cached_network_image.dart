import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class HomeCachedNetworkImage extends StatelessWidget {
  const HomeCachedNetworkImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              image:  DecorationImage(image:  CachedNetworkImageProvider(
                  'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29kaW5nfGVufDB8fDB8fHww&w=1000&q=80'
              )),
            ),
            child: CachedNetworkImage(
        imageUrl:
            "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29kaW5nfGVufDB8fDB8fHww&w=1000&q=80",
        progressIndicatorBuilder:  (context, url, progress) {
          if(progress.progress != null){
            final percent = progress.progress! * 100;
            return Text('$percent% done loading');
          }
          return const Text('loadig...');
        },
      ),
          )
          //
        ],
      ),
    );
  }
}
