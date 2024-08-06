class NewsModel {
  int? id;
  int? langId;
  String? title;
  String? titleSlug;
  String? keywords;
  String? summary;
  String? content;
  int? categoryId;
  String? imageBig;
  String? imageDefault;
  String? imageSlider;
  String? imageMid;
  String? imageSmall;
  String? imageMime;
  String? imageStorage;
  String? optionalUrl;
  int? pageviews;
  int? needAuth;
  int? isSlider;
  int? sliderOrder;
  int? isFeatured;
  int? featuredOrder;
  int? isRecommended;
  int? isBreaking;
  int? isScheduled;
  int? visibility;
  int? showRightColumn;
  String? postType;
  String? videoStorage;
  int? userId;
  int? status;
  int? showPostUrl;
  String? imageDescription;
  int? showItemNumbers;
  int? isPollPublic;
  String? createdAt;

  NewsModel(
      {this.id,
      this.langId,
      this.title,
      this.titleSlug,
      this.keywords,
      this.summary,
      this.content,
      this.categoryId,
      this.imageBig,
      this.imageDefault,
      this.imageSlider,
      this.imageMid,
      this.imageSmall,
      this.imageMime,
      this.imageStorage,
      this.optionalUrl,
      this.pageviews,
      this.needAuth,
      this.isSlider,
      this.sliderOrder,
      this.isFeatured,
      this.featuredOrder,
      this.isRecommended,
      this.isBreaking,
      this.isScheduled,
      this.visibility,
      this.showRightColumn,
      this.postType,
      this.videoStorage,
      this.userId,
      this.status,
      this.showPostUrl,
      this.imageDescription,
      this.showItemNumbers,
      this.isPollPublic,
      this.createdAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    langId = json['lang_id'];
    title = json['title'];
    titleSlug = json['title_slug'];
    keywords = json['keywords'];
    summary = json['summary'];
    content = json['content'];
    categoryId = json['category_id'];
    imageBig = json['image_big'];
    imageDefault = json['image_default'];
    imageSlider = json['image_slider'];
    imageMid = json['image_mid'];
    imageSmall = json['image_small'];
    imageMime = json['image_mime'];
    imageStorage = json['image_storage'];
    optionalUrl = json['optional_url'];
    pageviews = json['pageviews'];
    needAuth = json['need_auth'];
    isSlider = json['is_slider'];
    sliderOrder = json['slider_order'];
    isFeatured = json['is_featured'];
    featuredOrder = json['featured_order'];
    isRecommended = json['is_recommended'];
    isBreaking = json['is_breaking'];
    isScheduled = json['is_scheduled'];
    visibility = json['visibility'];
    showRightColumn = json['show_right_column'];
    postType = json['post_type'];
    videoStorage = json['video_storage'];
    userId = json['user_id'];
    status = json['status'];
    showPostUrl = json['show_post_url'];
    imageDescription = json['image_description'];
    showItemNumbers = json['show_item_numbers'];
    isPollPublic = json['is_poll_public'];
    createdAt = json['created_at'];
  }

}
