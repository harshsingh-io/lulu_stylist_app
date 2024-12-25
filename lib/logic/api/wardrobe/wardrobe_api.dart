import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/category.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/create_wardrobe_item_request.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:retrofit/retrofit.dart';

part 'wardrobe_api.g.dart';

@RestApi()
abstract class WardrobeApi {
  factory WardrobeApi(Dio dio) = _WardrobeApi;

  @GET('/api/wardrobe/items')
  Future<List<WardrobeItem>> getWardrobeItems(
    @Header('Authorization') String token,
    @Query('category') Category category, {
    @Query('skip') int skip = 0,
    @Query('limit') int limit = 100,
  });

  @POST('/api/wardrobe/items')
  Future<WardrobeItem> createWardrobeItem(
    @Header('Authorization') String token,
    @Body() CreateWardrobeItemRequest request,
  );

  @GET('/api/wardrobe/items/{itemId}')
  Future<WardrobeItem> getWardrobeItem(
    @Path('itemId') String itemId,
    @Header('Authorization') String token,
  );

  @PUT('/api/wardrobe/items/{itemId}')
  Future<WardrobeItem> updateWardrobeItem(
    @Path('itemId') String itemId,
    @Header('Authorization') String token,
    @Body() WardrobeItem item,
  );

  @DELETE('/api/wardrobe/items/{itemId}')
  Future<void> deleteWardrobeItem(
    @Path('itemId') String itemId,
    @Header('Authorization') String token,
  );

  @MultiPart()
  @POST('/api/wardrobe/items/{itemId}/image')
  Future<WardrobeItem> uploadItemImage(
    @Path('itemId') String itemId,
    @Part() File image,
    @Header('Authorization') String token,
  );
}
