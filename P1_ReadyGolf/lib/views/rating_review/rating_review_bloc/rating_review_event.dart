import 'dart:io';

class RatingReviewEvent {}

class RatingReviewInitialEvent extends RatingReviewEvent {}

class RatingReviewCreateEvent extends RatingReviewEvent {
  String productId;
  String productSku;
  String productTitle;
  String rating;
  String title;
  String body;
  List<File>? imageFile;
  RatingReviewCreateEvent(this.productId, this.productSku, this.productTitle,
      this.rating, this.title, this.body, this.imageFile);
}

class ImageUploadEvent extends RatingReviewEvent {
  File file;
  ImageUploadEvent(this.file);
}
