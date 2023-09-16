import 'dart:developer';

import 'package:datting/cubit/image_fullscreen/cubit/fullscreen_image_cubit.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/widget/back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoFullScreen extends StatefulWidget {
  final String image;
  const PhotoFullScreen({super.key, required this.image});

  @override
  State<PhotoFullScreen> createState() => _PhotoFullScreenState();
}

class _PhotoFullScreenState extends State<PhotoFullScreen> {
  String img = '';

  @override
  void initState() {
    img = widget.image;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: BlocConsumer<FullscreenImageCubit, FullscreenImageState>(
        listener: (context, state) {
          log(state.toString());
          if (state is FullScreenImage) {
            img = state.image;
          }
        },
        builder: (context, state) {
          return SafeArea(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .03),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: const Back(),
                ),
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .03),
              img != ''
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 562,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/$img.png'),
                              fit: BoxFit.fill)),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  image('gallary1'),
                  image('gallary2'),
                  image('gallary3'),
                  image('gallary4'),
                  image('gallary5')
                ],
              )
            ],
          ));
        },
      ),
    );
  }

  image(String image) {
    return Opacity(
      opacity: img == image ? 1 : .5,
      child: InkWell(
        onTap: () => context.read<FullscreenImageCubit>().image(image),
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/images/$image.png'),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
