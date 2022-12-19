import 'package:news_app/model/SourcesResponse.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<Articles>? articles;
  String? message;
  String? code;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":"cnn","name":"CNN"}
/// author : "CNN بالعربية"
/// title : "تعليق \"مسيء وغير مهذب\".. شاهد رئيس جامعة بأمريكا يتحدث بطريقة عنصرية ضد الآسيويين"
/// description : "تحدث رئيس جامعة بيردو الشمالية الغربية، توماس كيون، بعبارات عنصرية أدلى بها خلال خطاب الافتتاح، حيث كان الرئيس يتابع المتحدث الرئيسي الذي أشار إلى استخدام \"لغات مختلقة\" لأحفاده عدة مرات في خطابه، والتي لم تشير إلى الآسيويين، بل هي عبارات من العدم."
/// url : "https://arabic.cnn.com/world/video/2022/12/18/v131004-purdue-university-chancellor-racist-remarks"
/// urlToImage : "https://cnn-arabic-images.cnn.io/cloudinary/image/upload/w_1920,h_1008,c_fill,q_auto,g_center/t_cnnarabic_watermark_logo_v5/t_cnnarabic_watermark_player_icon_v2/cnnarabic/2022/12/18/images/228676.jpg"
/// publishedAt : "2022-12-18T10:58:32Z"
/// content : ""

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
