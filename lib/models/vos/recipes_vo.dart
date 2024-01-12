import 'package:json_annotation/json_annotation.dart';

part 'recipes_vo.g.dart';

@JsonSerializable()
class RecipesVO {
  @JsonKey(name: "Guid")
  String guid;

  @JsonKey(name: "Name")
  String name;

  @JsonKey(name: "Ingredients")
  String ingredients;

  @JsonKey(name: "CookingInstructions")
  String cookingInstructions;

  @JsonKey(name: "UserType")
  String userType;

  RecipesVO(
    this.guid,
    this.name,
    this.ingredients,
    this.cookingInstructions,
    this.userType,
  );
  factory RecipesVO.fromJson(Map<String, dynamic> json) =>
      _$RecipesVOFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecipesVOToJson(this);
}
