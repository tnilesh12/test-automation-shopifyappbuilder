import 'package:flutter/material.dart';
import 'package:publicapp/common/bloc/product_list_bloc/new_filter_list.dart';
import 'package:shopify_code/modelClass/sort_key_product_collection.dart';
import 'package:shopify_code/theme/app_theme.dart';

class SortBottomListView extends StatefulWidget {
  Function(FilterBottomList) sortListBy;

  SortBottomListView(this.sortListBy);

  @override
  State<SortBottomListView> createState() => _SortBottomListViewState();
}


class _SortBottomListViewState extends State<SortBottomListView> {
  String selected = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ListView.builder(
            itemCount: SortBottomList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          // activeColor: AppTheme.primaryButtonBackground,
                          checkColor: AppTheme.primaryButtonText,
                          // fillColor: MaterialStatePropertyAll(
                          //     AppTheme.primaryButtonBackground!.withAlpha(100)),
                          title: Text(
                            SortBottomList[index].title,
                            style: Theme.of(context).textTheme.bodySmall!,
                            // TextStyle(
                            //     fontSize: Theme.of(context)
                            //         .textTheme
                            //         .bodyMedium!
                            //         .fontSize,
                            //     color: AppTheme.black.withAlpha(120)),
                          ),
                          value: SortBottomList[index].valuee,
                          onChanged: (value) {
                            if (value == true) {
                              widget.sortListBy.call(SortBottomList[index]);
                            } else {
                              widget.sortListBy.call(SortBottomList[0]);
                            }
                            setState(() {
                              for (var element in SortBottomList) {
                                element.valuee = false;
                              }
                              SortBottomList[index].valuee = value;
                              selected =
                                  "${SortBottomList[index].title}, ${SortBottomList[index].valuee}";
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ],
                  )
                ],
              ));
            }));
  }
}
// onChanged: (value) {
//   setState(() {
//     valueFirst = value!;
//   });
//   if (value == true) {
//     context
//         .read<CheckoutScreenBloc>()
//         .add(CheckoutScreenSameAddressEvent());
//   }
// },
