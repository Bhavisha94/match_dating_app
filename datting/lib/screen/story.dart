import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Stories extends StatefulWidget {
  const Stories({super.key});

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/story.png'),
                fit: BoxFit.fill)),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * .025),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              LinearProgressIndicator(
                value: .3,
                color: ColorUtils.red,
                backgroundColor: ColorUtils.white,
                minHeight: 3,
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .015),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/p2.png'),
                          fit: BoxFit.fill)),
                ),
                title: Text(
                  'Annabelle',
                  style:
                      style.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                trailing: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: ColorUtils.white.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        color: ColorUtils.white,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorUtils.border),
                      color: ColorUtils.white.withOpacity(.2),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Your message',
                              hintStyle:
                                  style.copyWith(color: ColorUtils.white),
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide.none)),
                        )),
                        SizeUtils.horizontalSpacing(width: 5),
                        SvgPicture.asset(
                          'assets/images/sticker2.svg',
                        )
                      ],
                    ),
                  )),
                  SizeUtils.horizontalSpacing(width: 10),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: ColorUtils.white.withOpacity(.2),
                        border: Border.all(color: ColorUtils.border),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: SvgPicture.asset('assets/images/send.svg'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
