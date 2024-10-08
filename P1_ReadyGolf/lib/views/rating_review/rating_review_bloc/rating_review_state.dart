import 'package:shopify_code/modelClass/review_model.dart';

class RatingReviewState {}

class RatingReviewInitialState extends RatingReviewState {}

class RatingReviewLoadingState extends RatingReviewState {}

class RatingReviewLoadedState extends RatingReviewState {
  List<Reviews>? reviewList = [];
  int averageRating, numberOfReviews;
  RatingReviewLoadedState(
      this.reviewList, this.averageRating, this.numberOfReviews);
}

class RatingReviewNoDataState extends RatingReviewState {}

class RatingReviewSuccessState extends RatingReviewState {
  String msg;
  RatingReviewSuccessState(this.msg);
}

class RatingReviewFailureState extends RatingReviewState {
  String msg;
  RatingReviewFailureState(this.msg);
}

class ReviewImageUploadingState extends RatingReviewState {}

class ReviewImageUploadingErrorState extends RatingReviewState {
  String error;
  ReviewImageUploadingErrorState(this.error);
}

class ReviewImageUploadingAPIFailureState extends RatingReviewState {
  String error;
  ReviewImageUploadingAPIFailureState(this.error);
}

class ReviewImageUploadedState extends RatingReviewState {
  String success;
  ReviewImageUploadedState(this.success);
}

class RatingReviewSubmittingState extends RatingReviewState {}
