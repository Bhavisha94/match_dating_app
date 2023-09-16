import 'package:datting/screen/photo_full_screen.dart';
import 'package:datting/utils/size.dart';
import 'package:flutter/material.dart';

class GallaryPhotos extends StatelessWidget {
  const GallaryPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PhotoFullScreen(
                            image: 'gallary1',
                          ))),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width * .415,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/gallary1.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PhotoFullScreen(
                            image: 'gallary2',
                          ))),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width * .415,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/gallary2.png'),
                        fit: BoxFit.fill)),
              ),
            )
          ],
        ),
        SizeUtils.verticalSpacing(
            height: MediaQuery.of(context).size.height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PhotoFullScreen(
                            image: 'gallary3',
                          ))),
              child: Container(
                width: MediaQuery.of(context).size.width * .27,
                height: 122,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/gallary3.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PhotoFullScreen(
                            image: 'gallary4',
                          ))),
              child: Container(
                width: MediaQuery.of(context).size.width * .27,
                height: 122,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/gallary4.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PhotoFullScreen(
                            image: 'gallary5',
                          ))),
              child: Container(
                width: MediaQuery.of(context).size.width * .27,
                height: 122,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/gallary5.png'),
                        fit: BoxFit.fill)),
              ),
            )
          ],
        ),
      ],
    );
  }
}
