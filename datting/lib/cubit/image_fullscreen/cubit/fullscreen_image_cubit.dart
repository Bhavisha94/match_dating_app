import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'fullscreen_image_state.dart';

class FullscreenImageCubit extends Cubit<FullscreenImageState> {
  FullscreenImageCubit() : super(FullscreenImageInitial());

  image(String image) {
    log(image.toString());
    emit(FullscreenImageLoading());
    emit(FullScreenImage(image: image));
  }
}
