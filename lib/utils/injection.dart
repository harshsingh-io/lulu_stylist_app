// lib/injection.dart
import 'package:get_it/get_it.dart';
import 'package:lulu_stylist_app/logic/api_base.dart';
import 'package:lulu_stylist_app/logic/bloc/chat/chat_repository.dart';
import 'package:lulu_stylist_app/logic/bloc/wardrobe/wardrobe_repository.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register WardrobeRepository
  getIt.registerLazySingleton<WardrobeRepository>(
    () => WardrobeRepository(
      baseUrl: apiBase, // Replace with your actual base URL
    ),
  );
  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepository(baseUrl: apiBase),
  );

  // Register other dependencies as needed
}
