import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/modelClass/src/collection/collection.dart';
import 'package:shopify_code/theme/app_theme.dart';
import 'package:shopify_code/views/widgets/widget_image.dart';
import '../../../common/bloc/category_screen_bloc/category_screen_bloc.dart';

class CategoryRowViewLeftFromCollection extends StatelessWidget {
  final List<Collection> menus;

  CategoryRowViewLeftFromCollection({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
        builder: (context, state) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: menus!.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: AppTheme.borderColor!.withAlpha(120))),
                child: InkResponse(
                  child: Container(
                    color:
                        context.read<CategoryScreenBloc>().changeStyle == index
                            ? AppTheme.primaryButtonBackground!.withAlpha(120)
                            : AppTheme.secondaryButtonBackground,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                            child: Container(
                          height: 40,
                          width: 40,
                          child: WidgetImage(
                              context
                                          .read<CategoryScreenBloc>()
                                          .collectionList[index]
                                          .image !=
                                      null
                                  ? context
                                      .read<CategoryScreenBloc>()
                                      .collectionList[index]
                                      .image!
                                      .originalSrc
                                      .toString()
                                  : "",
                              fit: BoxFit.cover),
                        )),
                        Text(menus![index].title.toString(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall!),
                      ],
                    ),
                  ),
                  onTap: () {
                    context
                        .read<CategoryScreenBloc>()
                        .add(OnCategoryItemClick(index));
                  },
                ));
          });
    });
  }
}
