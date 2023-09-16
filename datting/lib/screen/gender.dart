import 'package:datting/cubit/gender/cubit/gender_cubit.dart';
import 'package:datting/screen/passion.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/appbar.dart';
import 'package:datting/widget/back.dart';
import 'package:datting/widget/button.dart';
import 'package:datting/widget/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: BlocConsumer<GenderCubit, GenderState>(
          listener: (context, state) {
            if (state is GenderIndex) {
              index = state.index;
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBar(
                  context: context,
                  action: [
                    Center(
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Passion())),
                        child: Text(
                          'Skip',
                          style: style.copyWith(
                              color: ColorUtils.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
                SizeUtils.verticalSpacing(
                    height: MediaQuery.of(context).size.height * .03),
                Text(
                  'I am a',
                  style:
                      style.copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizeUtils.verticalSpacing(
                    height: MediaQuery.of(context).size.height * .1),
                GenderSelectionWidget(
                    text: 'Woman',
                    icon: 'check',
                    index: 0,
                    genderIndex: index,
                    onCallBack: () => context.read<GenderCubit>().select(0)),
                SizeUtils.verticalSpacing(
                    height: MediaQuery.of(context).size.height * .015),
                GenderSelectionWidget(
                    text: 'Man',
                    icon: 'check',
                    index: 1,
                    genderIndex: index,
                    onCallBack: () => context.read<GenderCubit>().select(1)),
                SizeUtils.verticalSpacing(
                    height: MediaQuery.of(context).size.height * .015),
                GenderSelectionWidget(
                    text: 'Choose another',
                    icon: 'next',
                    index: 2,
                    genderIndex: index,
                    onCallBack: () => context.read<GenderCubit>().select(2)),
                const Spacer(),
                Button(
                    width: MediaQuery.of(context).size.width,
                    text: 'Continue',
                    onCallBack: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Passion()))),
                SizeUtils.verticalSpacing(
                    height: MediaQuery.of(context).size.height * .04),
              ],
            );
          },
        ),
      )),
    );
  }
}
