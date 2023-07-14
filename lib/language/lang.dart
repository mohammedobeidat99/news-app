import 'package:get/get_navigation/src/root/internacionalization.dart';

class Lang implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'Sports': 'رياضة',
          'Health': 'صحة',
          'Science': 'علوم',
          'Settings': 'الاعدادات',
          'Language': 'اللغة',
          'Change Language': 'تغيير اللغة',
          'English': 'انجليزي',
          'Arbic': 'عربي',
         'Dark Theme': 'الوضع المظلم',
         'Weather':'الطقس'
        },
        'en': {
          'Sports': 'Sports',
          'Health': 'Health',
          'Science': 'Science',
          'Settings': 'Settings',
          'Language': 'Language',
          'Change Language': 'Change Language',
          'English': 'English',
          'Arbic': 'Arbic',
          'Dark Theme': 'Dark Theme',
          'Weather':'Weather'
        }
      };
}
