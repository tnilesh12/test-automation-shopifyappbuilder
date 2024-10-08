import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:publicapp/common/bloc/rating_review_bloc/rating_review_bloc.dart';
import 'package:publicapp/common/bloc/rating_review_bloc/rating_review_event.dart';
import 'package:publicapp/common/bloc/rating_review_bloc/rating_review_state.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/modelClass/src/product/product.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/util/dialogs.dart';
import '../../utils/theme_size.dart';
import '/theme3/views/widgets/common/custom_button.dart';
import '/theme3/views/widgets/common/custom_dialog_button.dart';
import '/theme3/views/widgets/common/custom_textfield.dart';
import 'package:shopify_code/plugin/rating_review/star_widget_bloc/star_widget_bloc.dart';
import 'package:shopify_code/plugin/rating_review/widgets/star_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class AddReviewScreen extends StatefulWidget {
  final Product product;
  AddReviewScreen(this.product);
  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  // TextEditingController ratingController = TextEditingController();
  var rating = "0";
  List<File>? _imageFile = [];
  // bool isImageSelected = false;

  _pickImagefromGallery(RatingReviewBloc bloc) async {
    try {
      final pickedImage = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);
      if (pickedImage != null) {
        // setState(() {
        _imageFile!.add(File(pickedImage.path));
        // isImageSelected = true;
        // });
        if (pickedImage.path.isNotEmpty) {
          bloc.imagesUrl!.add(pickedImage.path);
          bloc.add(ImageUploadEvent(File(pickedImage.path)));
        }
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _pickImagefromCamera(RatingReviewBloc bloc) async {
    try {
      final pickedImage = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 100);
      if (pickedImage != null) {
        // setState(() {
        _imageFile!.add(File(pickedImage.path));
        // isImageSelected = true;
        // });
        if (pickedImage.path.isNotEmpty) {
          bloc.imagesUrl!.add(pickedImage.path);
          bloc.add(ImageUploadEvent(File(pickedImage.path)));
        }
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future showOptions(RatingReviewBloc bloc) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          Container(
            color: AppTheme.primaryColor,
            child: CupertinoActionSheetAction(
              child: Text(
                LanguageManager.translations()['PhotoGallery']!,
                style: TextStyle(color: AppTheme.appBarTextColor),
              ),
              onPressed: () {
                // close the options modal
                Navigator.of(context).pop();
                // get image from gallery
                _pickImagefromGallery(bloc);
              },
            ),
          ),
          Container(
            color: AppTheme.primaryColor,
            child: CupertinoActionSheetAction(
              child: Text(LanguageManager.translations()['Camera']!,
                  style: TextStyle(color: AppTheme.appBarTextColor)),
              onPressed: () {
                // close the options modal
                Navigator.of(context).pop();
                // get image from camera
                _pickImagefromCamera(
                    bloc); //---------------------------------------------------
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RatingReviewBloc(widget.product.id!),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
                icon: Container(
                  width: 35, //MediaQuery.of(context).size.width * 0.09,
                  height: 35, //MediaQuery.of(context).size.height * 0.09,
                  padding: EdgeInsets.fromLTRB(5, 5, 2, 5),
                  child: SvgPicture.asset("assets/images/arrow-back.svg",
                      colorFilter: ColorFilter.mode(
                          AppTheme.appBarTextColor!, BlendMode.srcIn)),
                ),
                onPressed: () {
                  context.pop();
                }),
          ),
          body: BlocListener<RatingReviewBloc, RatingReviewState>(
              listener: (context, state) {
            if (state is RatingReviewSuccessState) {
              Dialogs.SuccessAlertInOut(context: context, message: state.msg);
              context.pop(true);
            }
          }, child: BlocBuilder<RatingReviewBloc, RatingReviewState>(
                  builder: (context, state) {
            return Container(
              padding: EdgeInsets.fromLTRB(
                  ThemeSize.paddingLeft, 10, ThemeSize.paddingRight, 0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageManager.translations()['Rating']!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    StarWidget(
                      (r) {
                        rating = r;
                        print("------------------${r}");
                      },
                      true,
                      45,
                      initialCount: int.parse(rating),
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Title",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: CustomTextFormField().SimpleTextFormField(
                          controller: titleController,
                          context: context,
                          hintText:
                              LanguageManager.translations()['writeTitle'],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    LanguageManager.translations()['Review'],
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: CustomTextFormField().SimpleTextFormField(
                          controller: bodyController,
                          context: context,
                          hintText:
                              LanguageManager.translations()['WriteaReview']!,
                        )),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppTheme.borderColor!.withAlpha(50),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            showOptions(context.read<RatingReviewBloc>());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
                            child: Text(
                              LanguageManager.translations()['AddImage']!,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _imageFile!.isNotEmpty
                      ? SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _imageFile!.length,
                              itemBuilder: (context, index) {
                                if (state is ReviewImageUploadingErrorState) {
                                  return Stack(children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              ThemeSize.themeBorderRadius),
                                          color: Colors.grey.withAlpha(150),
                                          // image: DecorationImage(
                                          //     image: AssetImage(
                                          //         AppAssets.placeholder,), fit: BoxFit.cover)
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Text(
                                            LanguageManager.translations()[
                                                'error'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )),
                                    Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.red.withAlpha(200),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            child: SvgPicture.asset(
                                                "assets/images/close-icon.svg",
                                                colorFilter: ColorFilter.mode(
                                                    Colors.white,
                                                    BlendMode.srcIn)),
                                          ),
                                        ))
                                  ]);
                                } else if (state is ReviewImageUploadingState &&
                                    !context
                                        .read<RatingReviewBloc>()
                                        .imagesUrl![index]
                                        .contains("http")) {
                                  return InkWell(
                                    onTap: () {
                                      _imageFile!.removeAt(index);
                                      context
                                          .read<RatingReviewBloc>()
                                          .imagesUrl!
                                          .removeAt(index);
                                      setState(() {});
                                    },
                                    child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              ThemeSize.themeBorderRadius),
                                          color: Colors.grey.withAlpha(150),
                                          // image: DecorationImage(
                                          //     image: AssetImage(
                                          //         AppAssets.placeholder,), fit: BoxFit.cover)
                                        ),
                                        margin: EdgeInsets.all(5),
                                        child: Center(
                                          child: Text(
                                            LanguageManager.translations()[
                                                'uploading'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                        )),
                                  );
                                  // } else if (state is ReviewImageUploadedState) {
                                } else {
                                  return Stack(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(5),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                ThemeSize.themeBorderRadius),
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image:
                                                  FileImage(_imageFile![index]),
                                              width: 100,
                                              height: 100,
                                            ),
                                          )),
                                      Positioned(
                                          right: 0,
                                          top: 0,
                                          child: InkWell(
                                            onTap: () {
                                              _imageFile!.removeAt(index);
                                              context
                                                  .read<RatingReviewBloc>()
                                                  .imagesUrl!
                                                  .removeAt(index);
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color:
                                                      Colors.red.withAlpha(200),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Container(
                                                padding: EdgeInsets.all(4),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06,
                                                child: SvgPicture.asset(
                                                    "assets/images/close-icon.svg",
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            Colors.white,
                                                            BlendMode.srcIn)),
                                              ),
                                            ),
                                          ))
                                    ],
                                  );
                                }
                              }),
                        )
                      : Container(),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      child: (state is RatingReviewSubmittingState ||
                              state is ReviewImageUploadingState)
                          ? CustomDialogButton()
                          : CustomButton(
                              text: LanguageManager.translations()['Submit']!,
                              onPressed: () {
                                if (int.parse(rating) == 0) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: LanguageManager.translations()[
                                          'RequiredRating']!);
                                } else if (titleController.text
                                    .trim()
                                    .isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: LanguageManager.translations()[
                                          'RequiredTitle']!);
                                } else if (bodyController.text.trim().isEmpty) {
                                  Dialogs.ErrorAlertInOut(
                                      context: context,
                                      message: LanguageManager.translations()[
                                          'Requiredbody']!);
                                } else {
                                  context.read<RatingReviewBloc>().add(
                                      RatingReviewCreateEvent(
                                          widget.product.id.toString(),
                                          widget.product.id.toString(),
                                          widget.product.title.toString(),
                                          rating,
                                          titleController.text,
                                          bodyController.text,
                                          _imageFile));
                                }
                              }))
                ],
              ),
            );
          })),
        ));
  }
}
