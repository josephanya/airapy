import 'package:airapy/models/reminder_model.dart';
import 'package:airapy/services/notifications_manager.dart';
import 'package:airapy/services/register_providers.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter<ReminderModel>(ReminderModelAdapter());
  Hive.openBox<ReminderModel>('reminders');
  NotificationsManager().initNotifications();
  runApp(Airapy());
}

class Airapy extends StatefulWidget {
  @override
  _AirapyState createState() => _AirapyState();
}

class _AirapyState extends State<Airapy> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: registerProviders,
      child: OverlaySupport(
        child: MaterialApp(
          theme: themeData(context),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
