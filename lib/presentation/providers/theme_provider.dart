import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

/* %%%%%%%%%%%%%%%%%%%%%%% THEME %%%%%%%%%%%%%%%%%%%%%%% */
 // Listado de colores inmutable
 final colorListProvider = Provider((ref) => colorList);

  // Un simple int
 final selectedColorProvider = StateProvider((ref) => 0);
 
 // Un simple boolean
 final isDarkmodeProvider = StateProvider((ref) => false);
 
/* ------------------------------------------------------ */

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);


// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  
  // STATE = Estado = new AppTheme();
  ThemeNotifier(): super( AppTheme() );

  //? Darkmode
   void toggleDarkmode() {
     state = state.copyWith( isDarkmode: !state.isDarkmode  );
   }
  //? _____________

  void changeColorIndex( int colorIndex) {
    state = state.copyWith( selectedColor: colorIndex );
  }


}
