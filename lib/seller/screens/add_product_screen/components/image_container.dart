import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/imports/core_imports.dart';

class ImageContainer extends StatelessWidget {
  final XFile? fileImage;
  final VoidCallback onDelete;
  const ImageContainer({
    super.key,
    this.fileImage,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: Get.width * 0.25,
          clipBehavior: Clip.antiAlias,
          height: Get.height * 0.18,
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(
            //   color: CustomColors.primary,
            // ),
            borderRadius: BorderRadius.circular(
              10.r,
            ),
          ),
          child: Image.file(
                File(fileImage!.path),
                fit: BoxFit.cover,
              ),
        ),
        GestureDetector(
          onTap: onDelete,
          child: Padding(
            padding: EdgeInsets.all(
              4.w,
            ),
            child: Icon(
              Icons.delete_rounded,
              color: CustomColors.red,
              size: 16.w,
            ),
          ),
        ),
      ],
    );
  }
}
