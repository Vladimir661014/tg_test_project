import 'package:flutter_modular/flutter_modular.dart';
import 'package:tg_test_project/features/presentation/app/router/app_router.dart';
import 'package:tg_test_project/features/presentation/screens/main/main_screen.dart';
import 'package:tg_test_project/features/presentation/screens/settings/appearance/appearance_settings.dart';
import 'package:tg_test_project/features/presentation/screens/settings/data_storage/data_storage.dart';
import 'package:tg_test_project/features/presentation/screens/settings/profile/edit_name.dart';
import 'package:tg_test_project/features/presentation/screens/settings/profile/edit_profile.dart';
import 'package:tg_test_project/features/presentation/screens/settings/folders_settings/folders_settings.dart';
import 'package:tg_test_project/features/presentation/screens/settings/general_settings/general_settings.dart';
import 'package:tg_test_project/features/presentation/screens/settings/language_settings/language_settings.dart';
import 'package:tg_test_project/features/presentation/screens/settings/my_profile/my_profile.dart';
import 'package:tg_test_project/features/presentation/screens/settings/notifications/notifications.dart';
import 'package:tg_test_project/features/presentation/screens/settings/privacy_security/privacy_security.dart';
import 'package:tg_test_project/features/presentation/screens/settings/sessions_settings/sessions_settings.dart';
import 'package:tg_test_project/features/presentation/screens/settings/stickers_settings/stickers_settings.dart';
import 'package:tg_test_project/features/presentation/widgets/outlet/chat_story/chat_story.dart';
import '../../screens/settings/profile/profile_wrapper.dart';
import '../../widgets/outlet/settings_options/settings_options.dart';

class MainModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(ar.buildRoute('home')(),
        child: (context) => const MainScreen(),
        children: [
          ChildRoute('${ar.buildRoute('chat')()}/:chatId',
              child: (context) => ChatStory(id: r.args.params['chatId']),
              transition: TransitionType.noTransition),
          ChildRoute(ar.buildRoute('settings')(),
              child: (context) => const SettingsOptions(),
              transition: TransitionType.noTransition,
              children: [
                ChildRoute(ar.buildRoute('profile')(),
                    child: (context) => const ProfileWrapper(),
                    children: [
                      ChildRoute(ar.buildRoute('edit_profile')(),
                          child: (context) => const EditProfile()),
                      ChildRoute(ar.buildRoute('edit_name')(),
                          child: (context) => const EditName())
                    ]),
                ChildRoute(ar.buildRoute('my_profile')(),
                    child: (context) => const MyProfile()),
                ChildRoute(ar.buildRoute('general')(),
                    child: (context) => const GeneralSettings()),
                ChildRoute(ar.buildRoute('notification')(),
                    child: (context) => const NotificationsSettings()),
                ChildRoute(ar.buildRoute('privacy')(),
                    child: (context) => const PrivacyAndCecurity()),
                ChildRoute(ar.buildRoute('data_storage')(),
                    child: (context) => const DataStorage()),
                ChildRoute(ar.buildRoute('sessions')(),
                    child: (context) => const SessionsSettings()),
                ChildRoute(ar.buildRoute('appearance')(),
                    child: (context) => const AppearanceSettings()),
                ChildRoute(ar.buildRoute('languages')(),
                    child: (context) => const LanguageSettings()),
                ChildRoute(ar.buildRoute('stickers')(),
                    child: (context) => const StickersSettings()),
                ChildRoute(ar.buildRoute('folders')(),
                    child: (context) => const FoldersSettings()),
              ])
        ]);
  }
}
