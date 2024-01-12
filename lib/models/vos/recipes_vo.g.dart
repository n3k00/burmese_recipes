// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipesVO _$RecipesVOFromJson(Map<String, dynamic> json) => RecipesVO(
      json['Guid'] as String,
      json['Name'] as String,
      json['Ingredients'] as String,
      json['CookingInstructions'] as String,
      json['UserType'] as String,
    );

Map<String, dynamic> _$RecipesVOToJson(RecipesVO instance) => <String, dynamic>{
      'Guid': instance.guid,
      'Name': instance.name,
      'Ingredients': instance.ingredients,
      'CookingInstructions': instance.cookingInstructions,
      'UserType': instance.userType,
    };
