import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/wardrobe/models/wardrobe_item.dart';
import 'package:retrofit/retrofit.dart';

part 'wardrobe_api.g.dart';

@RestApi()
abstract class WardrobeApi {
  factory WardrobeApi(Dio dio) = _WardrobeApi;

  @GET('/api/wardrobe/items')
  Future<List<WardrobeItem>> getWardrobeItems();

  @POST('/api/wardrobe/items')
  Future<WardrobeItem> createWardrobeItem(
    @Body() WardrobeItem item,
  );

  @GET('/api/wardrobe/items/{itemId}')
  Future<WardrobeItem> getWardrobeItem(
    @Path('itemId') String itemId,
  );

  @PUT('/api/wardrobe/items/{itemId}')
  Future<WardrobeItem> updateWardrobeItem(
    @Path('itemId') String itemId,
    @Body() WardrobeItem item,
  );

  @DELETE('/api/wardrobe/items/{itemId}')
  Future<void> deleteWardrobeItem(
    @Path('itemId') String itemId,
  );

  @MultiPart()
  @POST('/api/wardrobe/items/{itemId}/image')
  Future<WardrobeItem> uploadItemImage(
    @Path('itemId') String itemId,
    @Part() File image,
  );
}
