import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'app/app.dart';
import 'data/local/storage_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  StorageRepository.init();

  runApp(App());
}
