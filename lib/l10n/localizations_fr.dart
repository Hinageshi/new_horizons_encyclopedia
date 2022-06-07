

import 'package:intl/intl.dart' as intl;
import 'localizations.dart';

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get error_fetching_data => 'Les données n\'ont pas pu être récupérées.';

  @override
  String get error_no_data_found => 'Aucune données correspondant à vos critères n\'ont pu être récupérées.';

  @override
  String get common_fish => 'Poissons';

  @override
  String get common_bugs => 'Insectes';

  @override
  String get common_sea_creatures => 'Créatures marines';

  @override
  String get common_email => 'Email';

  @override
  String get common_password => 'Mot de passe';

  @override
  String get sign_in_title => 'Connexion';

  @override
  String get sign_in_button => 'Se connecter';

  @override
  String get sign_in_remember_me => 'Se souvenir de moi';

  @override
  String get sign_up_title => 'Inscription';

  @override
  String get sign_up_name => 'Nom';

  @override
  String get sign_up_button => 'S\'inscrire';

  @override
  String get register_title => 'S\'enregistrer';

  @override
  String get forgot_password_title => 'Mot de passe oublié ?';

  @override
  String get forgot_password_description => 'Vous avez oublié votre mot de passe ? Pas de panique ! Entrez votre adresse email pour réinitialiser votre mot de passe.';

  @override
  String get forgot_password_reset => 'Réinitialiser';

  @override
  String user_profile_registration(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat('dd MMMM yyyy', localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Inscrit(e) depuis le $dateString';
  }

  @override
  String get user_profile_log_out => 'Se déconnecter';

  @override
  String get hour_all_day => 'Toute la journée';

  @override
  String get month_all_year => 'Toute l\'année';

  @override
  String get month_january => 'Janvier';

  @override
  String get month_february => 'Février';

  @override
  String get month_march => 'Mars';

  @override
  String get month_april => 'Avril';

  @override
  String get month_may => 'Mai';

  @override
  String get month_june => 'Juin';

  @override
  String get month_july => 'Juillet';

  @override
  String get month_august => 'Août';

  @override
  String get month_september => 'Septembre';

  @override
  String get month_october => 'Octobre';

  @override
  String get month_november => 'Novembre';

  @override
  String get month_december => 'Décembre';

  @override
  String get bug_location_beach => 'Plage';

  @override
  String get bug_location_beach_rocks => 'Plage (rochers)';

  @override
  String get bug_location_bushes_rocks_rain => 'Buissons/Rochers (pluie)';

  @override
  String get bug_location_flowers => 'Fleurs';

  @override
  String get bug_location_ground => 'Sol';

  @override
  String get bug_location_lights => 'Lumières';

  @override
  String get bug_location_near_water => 'Près de l\'eau';

  @override
  String get bug_location_palms => 'Palmiers';

  @override
  String get bug_location_rocks => 'Rochers';

  @override
  String get bug_location_rotten_turnips => 'Navets pourris';

  @override
  String get bug_location_sky => 'Ciel';

  @override
  String get bug_location_sky_black_purple_blue_flowers => 'Ciel (fleurs hybrides noires, violettes et bleues)';

  @override
  String get bug_location_snowballs => 'Boules de neige';

  @override
  String get bug_location_trash_rotten_turnips => 'Déchets/Navets pourris';

  @override
  String get bug_location_tree_stumps => 'Souches d\'arbres';

  @override
  String get bug_location_trees => 'Arbres';

  @override
  String get bug_location_trees_palms => 'Arbres et palmiers';

  @override
  String get bug_location_underground => 'Sous la terre';

  @override
  String get bug_location_villagers => 'Villageois';

  @override
  String get bug_location_water_surface => 'Surface de l\'eau';

  @override
  String get bug_location_white_flowers => 'Fleurs blanches';

  @override
  String get fish_location_ocean => 'Océan';

  @override
  String get fish_location_ocean_pontoon => 'Océan (ponton)';

  @override
  String get fish_location_ocean_rain_snow => 'Océan (pluie/neige)';

  @override
  String get fish_location_pond => 'Étang';

  @override
  String get fish_location_river => 'Rivière';

  @override
  String get fish_location_river_cliff => 'Rivière (falaise)';

  @override
  String get fish_location_river_mouth => 'Embouchure de rivière';

  @override
  String get fish_size_tiny => 'Minuscule';

  @override
  String get fish_size_small => 'Petite';

  @override
  String get fish_size_small_average => 'Petite/Moyenne';

  @override
  String get fish_size_medium => 'Moyenne';

  @override
  String get fish_size_medium_fin => 'Moyenne (aileron)';

  @override
  String get fish_size_medium_large => 'Moyenne/Grande';

  @override
  String get fish_size_large => 'Grande';

  @override
  String get fish_size_very_large => 'Très grande';

  @override
  String get fish_size_huge => 'Énorme';

  @override
  String get fish_size_huge_fin => 'Énorme (aileron)';

  @override
  String get fish_size_thin => 'Fine';

  @override
  String get movement_still => 'Immobile';

  @override
  String get movement_very_slow => 'Très lent';

  @override
  String get movement_slow => 'Lent';

  @override
  String get movement_medium => 'Moyen';

  @override
  String get movement_fast => 'Rapide';

  @override
  String get movement_very_fast => 'Très rapide';

  @override
  String get rarity_normal => 'Normal';

  @override
  String get rarity_rare => 'Rare';

  @override
  String get rarity_very_rare => 'Très rare';

  @override
  String get filter_rarity_all => 'Tout';

  @override
  String get filter_time_currently => 'Actuellement';

  @override
  String get filter_time_monthly => 'Par mois';

  @override
  String get filter_time_all => 'Tous les mois';

  @override
  String get order_type_id => 'ID';

  @override
  String get order_type_name => 'Nom';

  @override
  String get order_type_price => 'Prix';

  @override
  String get order_type_rarity => 'Rareté';

  @override
  String get order_sort_asc => 'Croissant';

  @override
  String get order_sort_desc => 'Décroissant';

  @override
  String get tile_new_month => 'Nouveau ce mois';

  @override
  String get tile_last_month => 'Dernier mois';

  @override
  String get sorting => 'Tri';

  @override
  String get sort_by => 'Trier par : ';

  @override
  String get sort_order => 'Ordre : ';

  @override
  String get filters => 'Filters';

  @override
  String get filters_time => 'Temps : ';

  @override
  String get filters_month => 'Mois : ';

  @override
  String get filters_rarity => 'Rareté : ';
}
