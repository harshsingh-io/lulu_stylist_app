import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:lulu_stylist_app/logic/api/devices/devices_api.dart';
import 'package:lulu_stylist_app/logic/api/devices/models/user_add_device.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_model.dart';
import 'package:lulu_stylist_app/logic/api/users/models/user_type.dart';
import 'package:lulu_stylist_app/logic/api/users/user_api.dart';
import 'package:lulu_stylist_app/logic/bloc/accounts/auth/auth_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/networks/network_bloc.dart';
import 'package:lulu_stylist_app/logic/dio_factory.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

Logger log = Logger(
  printer: PrettyPrinter(),
);

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  factory AuthenticationBloc() {
    return _instance;
  }
  AuthenticationBloc._internal() : super(_Initial()) {
    on<_CheckExisting>(_checkExisting);
    on<_NewUserLogin>(_userLoggedIn);
    on<_UserProfileUpdated>(_userProfileUpdate);
    on<_Logout>(_logout);
  }

  final String _logTag = 'LoginBloc';

  static final AuthenticationBloc _instance = AuthenticationBloc._internal();
  final _authRepository = AuthRepository(
    userApi: UserApi(DioFactory().create()),
  );

  Future<void> _logout(
    _Logout event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      await _authRepository.logout();
      /* Login for updating the device token to the backend */
      emit(AuthenticationState.loggedOut());
      add(const AuthenticationEvent.checkExisting());
    } on Exception catch (error, stackTrace) {
      log.e(_logTag, error: 'Caught an exception  $error     $stackTrace');
    }
  }

  Future<void> _userLoggedIn(
    _NewUserLogin event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      log.d('Auth token for user is : ${event.authToken}');
      await _authRepository.setAuthToken(event.authToken);
      await _authRepository.setUser(event.user);
      final user = await _authRepository.userApi.getMe();

      if (user.isProfileComplete() == false) {
        emit(
          AuthenticationState.userNeedsProfileDetails(
            userModel: event.user,
            authToken: event.authToken,
          ),
        );
      } else if (event.user.isProfileComplete() == true) {
        emit(
          AuthenticationState.userLoggedIn(
            user: event.user,
            authToken: event.authToken,
          ),
        );
      }
    } on Exception catch (error, stackTrace) {
      log.e(_logTag, error: 'Caught an exception  $error     $stackTrace');
    }
  }

  Future<void> _checkExisting(
    _CheckExisting event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      final authToken = await _authRepository.getAuthToken();
      final authUser = await _authRepository.getAuthUser();
      var isOnline = false;
      NetworkBloc().state.maybeWhen(
            success: () {
              isOnline = true;
            },
            failure: () {
              isOnline = false;
            },
            orElse: () {},
          );

      if (!isOnline && authToken != null && authUser != null) {
        emit(
          AuthenticationState.userNeedsProfileDetails(
            userModel: authUser,
            authToken: authToken,
          ),
        );
      } else if (authToken != null && authUser != null) {
        final user = await _authRepository.userApi.getMe();
        if (user.isProfileComplete() == false) {
          emit(
            AuthenticationState.userNeedsProfileDetails(
              userModel: authUser,
              authToken: authToken,
            ),
          );
        } else if (authUser.isProfileComplete()) {
          emit(
            AuthenticationState.userAuthenticated(
              user: authUser,
              authToken: authToken,
            ),
          );
        }
      } else {
        emit(AuthenticationState.unAuthenticated());
      }
    } on Exception catch (error, stackTrace) {
      log.e(_logTag, error: 'Caught an exception  $error     $stackTrace');
      emit(AuthenticationState.unAuthenticated());
    }
  }

  Future<void> _userProfileUpdate(
    _UserProfileUpdated event,
    Emitter<AuthenticationState> emit,
  ) async {
    await _authRepository.setUser(event.userModel);
    final authToken = await _authRepository.getAuthToken();

    if (event.userModel.isProfileComplete() == false) {
      emit(
        AuthenticationState.userNeedsProfileDetails(
          userModel: event.userModel,
          authToken: authToken!,
        ),
      );
    } else if (event.userModel.isProfileComplete() == true &&
        event.userModel.isActive) {
      emit(
        AuthenticationState.userLoggedIn(
          user: event.userModel,
          authToken: authToken!,
        ),
      );
    }
  }

  Future<void> setDeviceForNotification() async {
    // final firebaseToken = NotificationController();
    final token = await AwesomeNotificationsFcm().requestFirebaseAppToken();
    final userAddDevice = UserAddDevice(
      deviceToken: token,
      platform: 'android',
    );

    final deviceAddApi = DeviceAddApi(DioFactory().create());

    try {
      log.d(
        'Firebase Token from setDeviceForNotification : $token',
      );

      await deviceAddApi.addDevice(userAddDevice);
      log.d(
        'Device Token added from setDeviceNotification is $userAddDevice',
      );
    } catch (e) {
      log
        ..e(
          'Firebase Token from setDeviceForNotification : $token',
        )
        ..e(
          'Error is from setDeviceNotification is :   $e',
        );
    }
  }

  bool isAuthenticated() {
    return state.isAuthenticated;
  }

  bool isAuthUser() {
    return state.isAuthUser;
  }

  UserModel? authUser() {
    return state.authUser;
  }
}
