import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'search_model.freezed.dart';

part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
   const factory SearchModel({required final String username,
     final String? image,
    @JsonKey(name: '_id') required final String id}) = _SearchModel;



  factory SearchModel.fromJson(Map<String, Object?> data) =>
      _$SearchModelFromJson(data);


}
