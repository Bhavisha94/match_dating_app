import 'package:datting/model/chat_list.dart';
import 'package:datting/screen/story.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageSheet extends StatelessWidget {
  final ChatListModel chatModel;
  const MessageSheet(this.chatModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .9,
          child: Column(
            children: [
              SvgPicture.asset('assets/images/indicator.svg'),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .895,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bottom.png'),
                    fit: BoxFit.fill)),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Stories())),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            ColorUtils.gradient1,
                            ColorUtils.gradient2,
                            ColorUtils.gradient3
                          ])),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorUtils.white, width: 2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${chatModel.image}.png'),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                  title: Text(
                    chatModel.name,
                    style: style.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: ColorUtils.primary),
                  ),
                  subtitle: Row(
                    children: [
                      SvgPicture.asset('assets/images/online.svg'),
                      SizeUtils.horizontalSpacing(
                          width: MediaQuery.of(context).size.width * .015),
                      Text(
                        'Online',
                        style: style.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                  trailing: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.border),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Icon(
                        Icons.more_vert_outlined,
                        color: ColorUtils.primary,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/line_2.svg'),
                    Text(
                      'Today',
                      style: style.copyWith(
                          fontSize: 12,
                          color: ColorUtils.primary.withOpacity(.7)),
                    ),
                    SvgPicture.asset('assets/images/line_2.svg'),
                  ],
                ),
                SizeUtils.verticalSpacing(
                    height: MediaQuery.of(context).size.height * .015),
                Expanded(
                    child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: chats[index].sender
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: chats[index].sender
                                      ? ColorUtils.red.withOpacity(.1)
                                      : ColorUtils.bg,
                                  borderRadius: chats[index].sender
                                      ? const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))
                                      : const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                chats[index].msg,
                                style: style.copyWith(),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: chats[index].sender == true
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                              children: [
                                Text(
                                  chats[index].time,
                                  style: style.copyWith(
                                      fontSize: 12,
                                      color:
                                          ColorUtils.primary.withOpacity(.4)),
                                ),
                                SizeUtils.horizontalSpacing(
                                    width: MediaQuery.of(context).size.width *
                                        .01),
                                chats[index].sender == true
                                    ? const SizedBox()
                                    : SvgPicture.asset('assets/images/seen.svg')
                              ],
                            ),
                            SizeUtils.verticalSpacing(
                                height:
                                    MediaQuery.of(context).size.height * .01)
                          ],
                        ),
                      ),
                    );
                  },
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width * .73,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.border),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Your message',
                                hintStyle: style.copyWith(
                                    color: ColorUtils.primary.withOpacity(.4)),
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide.none)),
                          )),
                          SizeUtils.horizontalSpacing(width: 5),
                          SvgPicture.asset('assets/images/sticker.svg')
                        ],
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.border),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: SvgPicture.asset('assets/images/speaker.svg'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
