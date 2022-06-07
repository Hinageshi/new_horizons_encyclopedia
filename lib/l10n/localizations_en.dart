

import 'package:intl/intl.dart' as intl;
import 'localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get error_fetching_data => 'Data could not be fetched.';

  @override
  String get error_no_data_found => 'No data matching your criteria have been found.';

  @override
  String get common_fish => 'Fish';

  @override
  String get common_bugs => 'Bugs';

  @override
  String get common_sea_creatures => 'Sea creatures';

  @override
  String get common_email => 'Email';

  @override
  String get common_password => 'Password';

  @override
  String get sign_in_title => 'Sign in';

  @override
  String get sign_in_button => 'Sign in';

  @override
  String get sign_in_remember_me => 'Remember me';

  @override
  String get sign_up_title => 'Sign up';

  @override
  String get sign_up_name => 'Name';

  @override
  String get sign_up_button => 'Sign up';

  @override
  String get register_title => 'Register';

  @override
  String get forgot_password_title => 'Forgot password ?';

  @override
  String get forgot_password_description => 'Password forgotten ? Don\'t worry ! Enter your email adress to reset your password.';

  @override
  String get forgot_password_reset => 'Reset';

  @override
  String user_profile_registration(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat('dd MMMM yyyy', localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Registered since $dateString';
  }

  @override
  String get user_profile_log_out => 'Log out';

  @override
  String get hour_all_day => 'All day';

  @override
  String get month_all_year => 'All year';

  @override
  String get month_january => 'January';

  @override
  String get month_february => 'February';

  @override
  String get month_march => 'March';

  @override
  String get month_april => 'April';

  @override
  String get month_may => 'May';

  @override
  String get month_june => 'June';

  @override
  String get month_july => 'July';

  @override
  String get month_august => 'August';

  @override
  String get month_september => 'September';

  @override
  String get month_october => 'October';

  @override
  String get month_november => 'November';

  @override
  String get month_december => 'December';

  @override
  String get bug_location_beach => 'Beach';

  @override
  String get bug_location_beach_rocks => 'Beach (rocks)';

  @override
  String get bug_location_bushes_rocks_rain => 'Bushes/Rocks (rain)';

  @override
  String get bug_location_flowers => 'Flowers';

  @override
  String get bug_location_ground => 'Ground';

  @override
  String get bug_location_lights => 'Lights';

  @override
  String get bug_location_near_water => 'Near water';

  @override
  String get bug_location_palms => 'Palms';

  @override
  String get bug_location_rocks => 'Rocks';

  @override
  String get bug_location_rotten_turnips => 'Rotten turnips';

  @override
  String get bug_location_sky => 'Sky';

  @override
  String get bug_location_sky_black_purple_blue_flowers => 'Sky (black, purple and blue hybrid flowers)';

  @override
  String get bug_location_snowballs => 'Snowballs';

  @override
  String get bug_location_trash_rotten_turnips => 'Trash/Rotten turnips';

  @override
  String get bug_location_tree_stumps => 'Tree stumps';

  @override
  String get bug_location_trees => 'Trees';

  @override
  String get bug_location_trees_palms => 'Trees and palms';

  @override
  String get bug_location_underground => 'Underground';

  @override
  String get bug_location_villagers => 'Villagers';

  @override
  String get bug_location_water_surface => 'Water surface';

  @override
  String get bug_location_white_flowers => 'White flowers';

  @override
  String get fish_location_ocean => 'Ocean';

  @override
  String get fish_location_ocean_pontoon => 'Ocean (pontoon)';

  @override
  String get fish_location_ocean_rain_snow => 'Ocean (rain/snow)';

  @override
  String get fish_location_pond => 'Pond';

  @override
  String get fish_location_river => 'River';

  @override
  String get fish_location_river_cliff => 'River (cliff)';

  @override
  String get fish_location_river_mouth => 'River mouth';

  @override
  String get fish_size_tiny => 'Tiny';

  @override
  String get fish_size_small => 'Small';

  @override
  String get fish_size_small_average => 'Small/Average';

  @override
  String get fish_size_medium => 'Medium';

  @override
  String get fish_size_medium_fin => 'Medium (fin)';

  @override
  String get fish_size_medium_large => 'Medium/Large';

  @override
  String get fish_size_large => 'Large';

  @override
  String get fish_size_very_large => 'Very large';

  @override
  String get fish_size_huge => 'Huge';

  @override
  String get fish_size_huge_fin => 'Huge (fin)';

  @override
  String get fish_size_thin => 'Thin';

  @override
  String get movement_still => 'Still';

  @override
  String get movement_very_slow => 'Very slow';

  @override
  String get movement_slow => 'Slow';

  @override
  String get movement_medium => 'Medium';

  @override
  String get movement_fast => 'Fast';

  @override
  String get movement_very_fast => 'Very fast';

  @override
  String get rarity_normal => 'Normal';

  @override
  String get rarity_rare => 'Rare';

  @override
  String get rarity_very_rare => 'Very rare';

  @override
  String get filter_rarity_all => 'All';

  @override
  String get filter_time_currently => 'Currently';

  @override
  String get filter_time_monthly => 'Monthly';

  @override
  String get filter_time_all => 'All months';

  @override
  String get order_type_id => 'ID';

  @override
  String get order_type_name => 'Name';

  @override
  String get order_type_price => 'Price';

  @override
  String get order_type_rarity => 'Rarity';

  @override
  String get order_sort_asc => 'Ascendent';

  @override
  String get order_sort_desc => 'Descendent';

  @override
  String get tile_new_month => 'New this month';

  @override
  String get tile_last_month => 'Last month';

  @override
  String get sorting => 'Sorting';

  @override
  String get sort_by => 'Sort by: ';

  @override
  String get sort_order => 'Order: ';

  @override
  String get filters => 'Filters';

  @override
  String get filters_time => 'Time: ';

  @override
  String get filters_month => 'Month: ';

  @override
  String get filters_rarity => 'Rarity: ';
}
