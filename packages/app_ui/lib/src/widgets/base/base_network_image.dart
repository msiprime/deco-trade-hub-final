// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_template_by_msi/services/dependencies/src/dependency_injection.dart';
// import 'package:flutter_template_by_msi/services/logger/app_logger.dart';
// import 'package:flutter_template_by_msi/services/logger/event_logger.dart';
// import 'package:flutter_template_by_msi/ui/images/images.dart';
// import 'package:flutter_template_by_msi/ui/widgets/core_widgets/base_loader_widget.dart';
//
// /// A widget that displays a network image with caching, placeholder,
// /// and error handling.
// ///
// /// Provides a loading placeholder and an error widget if the image fails to
// /// load.
// class BaseNetworkImage extends StatelessWidget {
//   /// Creates a [BaseNetworkImage].
//   const BaseNetworkImage({
//     super.key,
//     this.imageUrl,
//     this.width,
//     this.height,
//     this.fit,
//     this.placeholderFit,
//     this.errorWidgetFit,
//     this.placeholderBorderRadius,
//     this.errorWidgetBorderRadius,
//   });
//
//   /// The URL of the image to display.
//   final String? imageUrl;
//
//   /// The width of the image.
//   final double? width;
//
//   /// The height of the image.
//   final double? height;
//
//   /// How the image should be inscribed into the space allocated during layout.
//   final BoxFit? fit;
//
//   /// How the placeholder should be inscribed into the space allocated during
//   /// layout.
//   final BoxFit? placeholderFit;
//
//   /// How the error widget should be inscribed into the space allocated during
//   /// layout.
//   final BoxFit? errorWidgetFit;
//
//   /// The border radius of the placeholder
//   final BorderRadiusGeometry? placeholderBorderRadius;
//
//   /// The border radius of the error widget.
//   final BorderRadiusGeometry? errorWidgetBorderRadius;
//
//   @override
//   Widget build(BuildContext context) => CachedNetworkImage(
//         imageUrl: imageUrl ?? '',
//         height: height,
//         width: width,
//         fit: fit,
//         placeholder: (_, __) => ClipRRect(
//           borderRadius: placeholderBorderRadius ?? BorderRadius.circular(6),
//           child: const Center(child: BaseLoaderWidget()),
//         ),
//         errorWidget: (_, __, ___) => ClipRRect(
//           borderRadius: errorWidgetBorderRadius ?? BorderRadius.circular(6),
//           child: Image.asset(
//             Images.placeholderImagePng.path,
//             fit: errorWidgetFit,
//           ),
//         ),
//         errorListener: (error) {
//           final message = 'Error loading network image from $imageUrl';
//           ServiceProvider.get<EventLogger>().recordEvent(
//             message: message,
//             stackTrace: StackTrace.current,
//             level: EventLoggerLevel.error,
//           );
//           ServiceProvider.get<AppLogger>().log(message);
//         },
//       );
// }
