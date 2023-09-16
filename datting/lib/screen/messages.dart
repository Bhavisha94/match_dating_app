import 'package:datting/model/chat_list.dart';
import 'package:datting/screen/story.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/message_sheet.dart';
import 'package:datting/widget/settings_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: style.copyWith(
                        fontSize: 34, fontWeight: FontWeight.w700),
                  ),
                  const SettingIcon(),
                ],
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .025),
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height * .06,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(
                          child: SvgPicture.asset('assets/images/search.svg')),
                    ),
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Search',
                    hintStyle: style.copyWith(
                        color: ColorUtils.primary.withOpacity(.4))),
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .015),
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              child: Text(
                'Activities',
                textAlign: TextAlign.start,
                style:
                    style.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .01),
            SizedBox(
              height: MediaQuery.of(context).size.height * .12,
              child: ListView.builder(
                itemCount: activities.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .07),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: index == 0 ||
                                  index == 1 ||
                                  index == 4 ||
                                  index == 7
                              ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Stories()))
                              : () {},
                          child: Container(
                            width: 66,
                            height: 66,
                            padding: const EdgeInsets.all(3),
                            decoration: index == 0 ||
                                    index == 1 ||
                                    index == 4 ||
                                    index == 7
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      ColorUtils.gradient1,
                                      ColorUtils.gradient2,
                                      ColorUtils.gradient3
                                    ]))
                                : const BoxDecoration(),
                            child: Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                  color: ColorUtils.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/${activities[index].image}.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                        SizeUtils.verticalSpacing(
                            height: MediaQuery.of(context).size.height * .01),
                        Text(
                          activities[index].name,
                          style: style.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .01),
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              child: Text(
                'Messages',
                textAlign: TextAlign.start,
                style:
                    style.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: chatList.length,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .015),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () => showMessageSheet(chatList[index]),
                        leading: InkWell(
                          onTap: index == 0 ||
                                  index == 1 ||
                                  index == 4 ||
                                  index == 7
                              ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Stories()))
                              : () {},
                          child: Container(
                            width: 56,
                            height: 56,
                            padding: const EdgeInsets.all(2.5),
                            decoration: index == 0 ||
                                    index == 1 ||
                                    index == 4 ||
                                    index == 7
                                ? BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      ColorUtils.gradient1,
                                      ColorUtils.gradient2,
                                      ColorUtils.gradient3
                                    ]))
                                : const BoxDecoration(),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/${chatList[index].image}.png'),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                        title: Text(
                          chatList[index].name,
                          style: style.copyWith(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          chatList[index].msg,
                          style: style.copyWith(color: ColorUtils.primary),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              chatList[index].time,
                              style: style.copyWith(
                                  color: ColorUtils.inactive,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizeUtils.verticalSpacing(
                                height:
                                    MediaQuery.of(context).size.height * .01),
                            chatList[index].pendingMsg != ''
                                ? Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.red),
                                    child: Center(
                                      child: Text(
                                        chatList[index].pendingMsg,
                                        style: style.copyWith(
                                            color: ColorUtils.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .2,
                            right: MediaQuery.of(context).size.width * .03),
                        child: Divider(
                          height: MediaQuery.of(context).size.height * .0,
                        ),
                      )
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      )),
    );
  }

  showMessageSheet(ChatListModel chatModel) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return MessageSheet(chatModel);
      },
    );
  }
}
