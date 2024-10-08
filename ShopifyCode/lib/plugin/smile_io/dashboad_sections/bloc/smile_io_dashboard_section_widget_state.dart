part of 'smile_io_dashboard_section_widget_bloc.dart';

@immutable
sealed class SmileIoDashboardSectionWidgetState {}


final class SmileIoDashboardSectionWidgetInitialState extends SmileIoDashboardSectionWidgetState {}

final class SmileIoDashboardSectionWidgetLoadingState extends SmileIoDashboardSectionWidgetState {}

final class SmileIoDashboardSectionWidgetAPIFailureState extends SmileIoDashboardSectionWidgetState {
  String message;
  SmileIoDashboardSectionWidgetAPIFailureState(this.message);
}

final class SmileIoDashboardSectionWidgetDataLoadedState extends SmileIoDashboardSectionWidgetState {}

final class SmileIoDashboardSectionWidgetNoLoginState extends SmileIoDashboardSectionWidgetState {}
