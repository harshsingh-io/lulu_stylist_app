import 'package:dio/dio.dart';
import 'package:lulu_stylist_app/logic/api/devices/models/user_add_device.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_device_model.dart';
import 'package:retrofit/retrofit.dart';

part 'devices_api.g.dart';

@RestApi()
abstract class DeviceAddApi {
  factory DeviceAddApi(Dio dio) = _DeviceAddApi;

  @POST('/devices')
  Future<UserDeviceModel> addDevice(
    @Body() UserAddDevice userAddDevice,
  );
}
