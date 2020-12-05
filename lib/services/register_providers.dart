import 'package:airapy/view_models/coach_chat_vm.dart';
import 'package:airapy/view_models/track_data_vm.dart';
import 'package:airapy/view_models/user_auth_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final registerProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => SignUpViewModel()),
  ChangeNotifierProvider(create: (_) => SignInViewModel()),
  ChangeNotifierProvider(create: (_) => ResetPasswordViewModel()),
  ChangeNotifierProvider(create: (_) => TrackFoodViewModel()),
  ChangeNotifierProvider(create: (_) => CoachChatViewModel()),
];
