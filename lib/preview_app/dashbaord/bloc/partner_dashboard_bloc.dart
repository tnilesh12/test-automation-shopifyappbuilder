import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopify_code/session/session.dart';
part 'partner_dashboard_event.dart';
part 'partner_dashboard_state.dart';

class PartnerDashboardBloc
    extends Bloc<PartnerDashboardEvent, PartnerDashboardState> {
  PartnerDashboardBloc() : super(PartnerDashboardInitialState()) {
    on<PartnerDashboardEvent>((event, emit) {});

    getPartnerLoginInfo();
  }

  // dynamic? partnerInfo;
  Map<String, dynamic>? partnerInfo;

  getPartnerLoginInfo() async {
    emit(PartnerDashboardLoadingState());
    partnerInfo = await Session().getPartnerLoginData();
    print("---------partnerInfo-----dashboard-bloc-----${partnerInfo}-------------");
    emit(PartnerDashboardLoadedState());
  }
}
