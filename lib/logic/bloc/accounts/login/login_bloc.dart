import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/common/models/login_request_model.dart';
import 'package:lulu_stylist_app/logic/api/devices/devices_api.dart';
import 'package:lulu_stylist_app/logic/api/devices/models/user_add_device.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_type.dart';
import 'package:lulu_stylist_app/logic/api/users/user_api.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/authentication_bloc.dart';
import 'package:lulu_stylist_app/logic/dio_factory.dart';
import 'package:lulu_stylist_app/notification/notification_controller.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const _Initial()) {
    on<_StartLogin>(_startLogin);
    on<_VerifyLogin>(_verifyLogin);
  }

  final _authenticationBloc = AuthenticationBloc();
  final _userApi = UserApi(DioFactory().create());
  final String _logTag = 'LoginBloc';

  Future<void> _startLogin(
    _StartLogin event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.inProgress());

    try {
      await Future.delayed(const Duration(seconds: 1), () {
        emit(
          LoginState.loginStarted(
            userType: event.userType,
            phone: event.phone,
            attempts: event.attempts + 1,
          ),
        );
      });
    } on Exception catch (error, stackTrace) {
      log.e(_logTag, error: error, stackTrace: stackTrace);
      addError(error, stackTrace);
      emit(LoginState.error(error.toString()));
    }
  }

  Future<void> _verifyLogin(
    _VerifyLogin event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState.inProgress());

    try {
      final notifController = NotificationController();
      log.d(
        'Firebase Token from login bloc is : ${notifController.firebaseToken}',
      );

      if (event.userType == UserType.user) {
        final loggedInUser = await _userApi.loginUser(
          LoginRequestModel(
            phone: event.phone,
            otp: event.otp,
          ),
        );

        emit(
          LoginState.loginUserSuccess(
            authToken: loggedInUser.accessToken,
            user: loggedInUser.user,
            userType: event.userType,
          ),
        );

        _authenticationBloc.add(
          AuthenticationEvent.newUserLogin(
            authToken: loggedInUser.accessToken,
            user: loggedInUser.user,
          ),
        );

        await setDeviceForNotification();
      } else {
        //TODO : Stylist Login
      }
    } on Exception catch (error, stackTrace) {
      if (error is DioException) {
        log.e(_logTag, error: error, stackTrace: stackTrace);
        if (error.response!.data['detail'] == 'Otp mismatch') {
          emit(const LoginState.error('Otp mismatch'));
        }
      } else {
        log.e(_logTag, error: error, stackTrace: stackTrace);
        addError(error, stackTrace);
        emit(LoginState.error(error.toString()));
      }
    }
  }

  Future<void> setDeviceForNotification() async {
    final token = await AwesomeNotificationsFcm().requestFirebaseAppToken();
    final userAddDevice = UserAddDevice(
      deviceToken: token,
      platform: 'android',
    );

    final deviceAddApi = DeviceAddApi(DioFactory().create());

    try {
      log.w(
        'Firebase Token from setDeviceForNotification : $token',
      );

      await deviceAddApi.addDevice(userAddDevice);
      log.d(
        'Device Token added from setDeviceNotification is',
      );
    } catch (e) {
      log.e(
        'Firebase Token from setDeviceForNotification : $token and Error is : $e',
      );
    }
  }
}
