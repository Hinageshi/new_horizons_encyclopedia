
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_en.dart';
import 'localizations_fr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @error_fetching_data.
  ///
  /// In en, this message translates to:
  /// **'Data could not be fetched.'**
  String get error_fetching_data;

  /// No description provided for @error_no_data_found.
  ///
  /// In en, this message translates to:
  /// **'No data matching your criteria have been found.'**
  String get error_no_data_found;

  /// No description provided for @common_fish.
  ///
  /// In en, this message translates to:
  /// **'Fish'**
  String get common_fish;

  /// No description provided for @common_bugs.
  ///
  /// In en, this message translates to:
  /// **'Bugs'**
  String get common_bugs;

  /// No description provided for @common_sea_creatures.
  ///
  /// In en, this message translates to:
  /// **'Sea creatures'**
  String get common_sea_creatures;

  /// No description provided for @common_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get common_email;

  /// No description provided for @common_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get common_password;

  /// No description provided for @sign_in_title.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in_title;

  /// No description provided for @sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get sign_in_button;

  /// No description provided for @sign_in_remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get sign_in_remember_me;

  /// No description provided for @sign_up_title.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up_title;

  /// No description provided for @sign_up_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sign_up_name;

  /// No description provided for @sign_up_button.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up_button;

  /// No description provided for @register_title.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_title;

  /// No description provided for @forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot password ?'**
  String get forgot_password_title;

  /// No description provided for @forgot_password_description.
  ///
  /// In en, this message translates to:
  /// **'Password forgotten ? Don\'t worry ! Enter your email adress to reset your password.'**
  String get forgot_password_description;

  /// No description provided for @forgot_password_reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get forgot_password_reset;

  /// No description provided for @user_profile_registration.
  ///
  /// In en, this message translates to:
  /// **'Registered since {date}'**
  String user_profile_registration(DateTime date);

  /// No description provided for @user_profile_log_out.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get user_profile_log_out;

  /// No description provided for @hour_all_day.
  ///
  /// In en, this message translates to:
  /// **'All day'**
  String get hour_all_day;

  /// No description provided for @month_all_year.
  ///
  /// In en, this message translates to:
  /// **'All year'**
  String get month_all_year;

  /// No description provided for @month_january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get month_january;

  /// No description provided for @month_february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get month_february;

  /// No description provided for @month_march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get month_march;

  /// No description provided for @month_april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get month_april;

  /// No description provided for @month_may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get month_may;

  /// No description provided for @month_june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get month_june;

  /// No description provided for @month_july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get month_july;

  /// No description provided for @month_august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get month_august;

  /// No description provided for @month_september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get month_september;

  /// No description provided for @month_october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get month_october;

  /// No description provided for @month_november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get month_november;

  /// No description provided for @month_december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get month_december;

  /// No description provided for @bug_location_beach.
  ///
  /// In en, this message translates to:
  /// **'Beach'**
  String get bug_location_beach;

  /// No description provided for @bug_location_beach_rocks.
  ///
  /// In en, this message translates to:
  /// **'Beach (rocks)'**
  String get bug_location_beach_rocks;

  /// No description provided for @bug_location_bushes_rocks_rain.
  ///
  /// In en, this message translates to:
  /// **'Bushes/Rocks (rain)'**
  String get bug_location_bushes_rocks_rain;

  /// No description provided for @bug_location_flowers.
  ///
  /// In en, this message translates to:
  /// **'Flowers'**
  String get bug_location_flowers;

  /// No description provided for @bug_location_ground.
  ///
  /// In en, this message translates to:
  /// **'Ground'**
  String get bug_location_ground;

  /// No description provided for @bug_location_lights.
  ///
  /// In en, this message translates to:
  /// **'Lights'**
  String get bug_location_lights;

  /// No description provided for @bug_location_near_water.
  ///
  /// In en, this message translates to:
  /// **'Near water'**
  String get bug_location_near_water;

  /// No description provided for @bug_location_palms.
  ///
  /// In en, this message translates to:
  /// **'Palms'**
  String get bug_location_palms;

  /// No description provided for @bug_location_rocks.
  ///
  /// In en, this message translates to:
  /// **'Rocks'**
  String get bug_location_rocks;

  /// No description provided for @bug_location_rotten_turnips.
  ///
  /// In en, this message translates to:
  /// **'Rotten turnips'**
  String get bug_location_rotten_turnips;

  /// No description provided for @bug_location_sky.
  ///
  /// In en, this message translates to:
  /// **'Sky'**
  String get bug_location_sky;

  /// No description provided for @bug_location_sky_black_purple_blue_flowers.
  ///
  /// In en, this message translates to:
  /// **'Sky (black, purple and blue hybrid flowers)'**
  String get bug_location_sky_black_purple_blue_flowers;

  /// No description provided for @bug_location_snowballs.
  ///
  /// In en, this message translates to:
  /// **'Snowballs'**
  String get bug_location_snowballs;

  /// No description provided for @bug_location_trash_rotten_turnips.
  ///
  /// In en, this message translates to:
  /// **'Trash/Rotten turnips'**
  String get bug_location_trash_rotten_turnips;

  /// No description provided for @bug_location_tree_stumps.
  ///
  /// In en, this message translates to:
  /// **'Tree stumps'**
  String get bug_location_tree_stumps;

  /// No description provided for @bug_location_trees.
  ///
  /// In en, this message translates to:
  /// **'Trees'**
  String get bug_location_trees;

  /// No description provided for @bug_location_trees_palms.
  ///
  /// In en, this message translates to:
  /// **'Trees and palms'**
  String get bug_location_trees_palms;

  /// No description provided for @bug_location_underground.
  ///
  /// In en, this message translates to:
  /// **'Underground'**
  String get bug_location_underground;

  /// No description provided for @bug_location_villagers.
  ///
  /// In en, this message translates to:
  /// **'Villagers'**
  String get bug_location_villagers;

  /// No description provided for @bug_location_water_surface.
  ///
  /// In en, this message translates to:
  /// **'Water surface'**
  String get bug_location_water_surface;

  /// No description provided for @bug_location_white_flowers.
  ///
  /// In en, this message translates to:
  /// **'White flowers'**
  String get bug_location_white_flowers;

  /// No description provided for @fish_location_ocean.
  ///
  /// In en, this message translates to:
  /// **'Ocean'**
  String get fish_location_ocean;

  /// No description provided for @fish_location_ocean_pontoon.
  ///
  /// In en, this message translates to:
  /// **'Ocean (pontoon)'**
  String get fish_location_ocean_pontoon;

  /// No description provided for @fish_location_ocean_rain_snow.
  ///
  /// In en, this message translates to:
  /// **'Ocean (rain/snow)'**
  String get fish_location_ocean_rain_snow;

  /// No description provided for @fish_location_pond.
  ///
  /// In en, this message translates to:
  /// **'Pond'**
  String get fish_location_pond;

  /// No description provided for @fish_location_river.
  ///
  /// In en, this message translates to:
  /// **'River'**
  String get fish_location_river;

  /// No description provided for @fish_location_river_cliff.
  ///
  /// In en, this message translates to:
  /// **'River (cliff)'**
  String get fish_location_river_cliff;

  /// No description provided for @fish_location_river_mouth.
  ///
  /// In en, this message translates to:
  /// **'River mouth'**
  String get fish_location_river_mouth;

  /// No description provided for @fish_size_tiny.
  ///
  /// In en, this message translates to:
  /// **'Tiny'**
  String get fish_size_tiny;

  /// No description provided for @fish_size_small.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get fish_size_small;

  /// No description provided for @fish_size_small_average.
  ///
  /// In en, this message translates to:
  /// **'Small/Average'**
  String get fish_size_small_average;

  /// No description provided for @fish_size_medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get fish_size_medium;

  /// No description provided for @fish_size_medium_fin.
  ///
  /// In en, this message translates to:
  /// **'Medium (fin)'**
  String get fish_size_medium_fin;

  /// No description provided for @fish_size_medium_large.
  ///
  /// In en, this message translates to:
  /// **'Medium/Large'**
  String get fish_size_medium_large;

  /// No description provided for @fish_size_large.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get fish_size_large;

  /// No description provided for @fish_size_very_large.
  ///
  /// In en, this message translates to:
  /// **'Very large'**
  String get fish_size_very_large;

  /// No description provided for @fish_size_huge.
  ///
  /// In en, this message translates to:
  /// **'Huge'**
  String get fish_size_huge;

  /// No description provided for @fish_size_huge_fin.
  ///
  /// In en, this message translates to:
  /// **'Huge (fin)'**
  String get fish_size_huge_fin;

  /// No description provided for @fish_size_thin.
  ///
  /// In en, this message translates to:
  /// **'Thin'**
  String get fish_size_thin;

  /// No description provided for @movement_still.
  ///
  /// In en, this message translates to:
  /// **'Still'**
  String get movement_still;

  /// No description provided for @movement_very_slow.
  ///
  /// In en, this message translates to:
  /// **'Very slow'**
  String get movement_very_slow;

  /// No description provided for @movement_slow.
  ///
  /// In en, this message translates to:
  /// **'Slow'**
  String get movement_slow;

  /// No description provided for @movement_medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get movement_medium;

  /// No description provided for @movement_fast.
  ///
  /// In en, this message translates to:
  /// **'Fast'**
  String get movement_fast;

  /// No description provided for @movement_very_fast.
  ///
  /// In en, this message translates to:
  /// **'Very fast'**
  String get movement_very_fast;

  /// No description provided for @rarity_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get rarity_normal;

  /// No description provided for @rarity_rare.
  ///
  /// In en, this message translates to:
  /// **'Rare'**
  String get rarity_rare;

  /// No description provided for @rarity_very_rare.
  ///
  /// In en, this message translates to:
  /// **'Very rare'**
  String get rarity_very_rare;

  /// No description provided for @filter_rarity_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filter_rarity_all;

  /// No description provided for @filter_time_currently.
  ///
  /// In en, this message translates to:
  /// **'Currently'**
  String get filter_time_currently;

  /// No description provided for @filter_time_monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get filter_time_monthly;

  /// No description provided for @filter_time_all.
  ///
  /// In en, this message translates to:
  /// **'All months'**
  String get filter_time_all;

  /// No description provided for @order_type_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get order_type_id;

  /// No description provided for @order_type_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get order_type_name;

  /// No description provided for @order_type_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get order_type_price;

  /// No description provided for @order_type_rarity.
  ///
  /// In en, this message translates to:
  /// **'Rarity'**
  String get order_type_rarity;

  /// No description provided for @order_sort_asc.
  ///
  /// In en, this message translates to:
  /// **'Ascendent'**
  String get order_sort_asc;

  /// No description provided for @order_sort_desc.
  ///
  /// In en, this message translates to:
  /// **'Descendent'**
  String get order_sort_desc;

  /// No description provided for @tile_new_month.
  ///
  /// In en, this message translates to:
  /// **'New this month'**
  String get tile_new_month;

  /// No description provided for @tile_last_month.
  ///
  /// In en, this message translates to:
  /// **'Last month'**
  String get tile_last_month;

  /// No description provided for @sorting.
  ///
  /// In en, this message translates to:
  /// **'Sorting'**
  String get sorting;

  /// No description provided for @sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort by: '**
  String get sort_by;

  /// No description provided for @sort_order.
  ///
  /// In en, this message translates to:
  /// **'Order: '**
  String get sort_order;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @filters_time.
  ///
  /// In en, this message translates to:
  /// **'Time: '**
  String get filters_time;

  /// No description provided for @filters_month.
  ///
  /// In en, this message translates to:
  /// **'Month: '**
  String get filters_month;

  /// No description provided for @filters_rarity.
  ///
  /// In en, this message translates to:
  /// **'Rarity: '**
  String get filters_rarity;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
