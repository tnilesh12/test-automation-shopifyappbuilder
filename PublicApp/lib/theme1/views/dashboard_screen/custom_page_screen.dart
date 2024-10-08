import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopify_code/language/language_manager.dart';
import 'package:shopify_code/theme/app_assets.dart';
import '/theme1/views/dashboard_screen/custom_page_bloc/bloc/custom_page_bloc_bloc.dart';
import '/theme1/views/shimmer/home_screen_shimmer_view.dart';
import '../../../common/widgets/custome_page_from_json.dart';
import '/theme1/views/widgets/no_data_view.dart';

class CustomPageScreen extends StatefulWidget {
  String? pageId;
  bool showAppBar;

  CustomPageScreen(this.pageId, {this.showAppBar = true, super.key});

  @override
  State<CustomPageScreen> createState() => _CustomPageScreenState();
}

class _CustomPageScreenState extends State<CustomPageScreen> {
  late CustomPageBlocBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = CustomPageBlocBloc(widget.pageId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.add(CustomPageBlocEventrefresh(widget.pageId));
    return BlocProvider(
        create: (context) => bloc,
        child: BlocListener<CustomPageBlocBloc, CustomPageBlocState>(
          listener: ((context, state) async {
            // if (state is DashboardScreenCustomerNotFoundState) {
            //   context.pushReplacement("/${Routes.customerDataNotFoundScreen}");
            // }
          }),
          child: BlocBuilder<CustomPageBlocBloc, CustomPageBlocState>(
              builder: ((context, state) {
            if (state is CustomePageSuccessState) {
              if (widget.showAppBar) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(state.dashboardDataItems!.name.toString()),
                  ),
                  body: Container(
                    // height: 300,
                    child: SingleChildScrollView(
                        child: CustomePageFromJson()
                            .GetWidget(context, state.dashboardDataItems!)),
                  ),
                );
              } else {
                return Container(
                  // height: 300,
                  child: SingleChildScrollView(
                      child: CustomePageFromJson()
                          .GetWidget(context, state.dashboardDataItems!)),
                );
              }
            } else {
              return Scaffold(body: HomeScreenShimmerView());
            }
          })),
        ));
  }
}
