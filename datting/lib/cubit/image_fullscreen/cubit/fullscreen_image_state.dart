part of 'fullscreen_image_cubit.dart';

abstract class FullscreenImageState {}

class FullscreenImageInitial extends FullscreenImageState {}

class FullscreenImageLoading extends FullscreenImageState {}

class FullScreenImage extends FullscreenImageState {
  final String image;
  FullScreenImage({required this.image});
}
