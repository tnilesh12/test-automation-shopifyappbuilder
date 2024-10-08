import 'package:shopify_code/modelClass/insta_feed/insta_feed_model.dart';

class InstaFeedState {}

class InstaFeedInitialState extends InstaFeedState {}

class InstaFeedLoadingState extends InstaFeedState {}

class InstaFeedDataLoadedState extends InstaFeedState {
  InstaFeedModel instaFeedModel;
  InstaFeedDataLoadedState(this.instaFeedModel);
}

class InstaFeedAPIFailureState extends InstaFeedState {
  String message;
  InstaFeedAPIFailureState(this.message);
}