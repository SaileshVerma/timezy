import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezy/utils/app_config.dart';
import 'package:timezy/utils/random_number_geenrator.dart';

final remainingTimeStateProvider =
    StateProvider((ref) => AppConfig.timeForClick);

final currentTimeInSeconds = StateProvider((ref) => DateTime.now().second);

final randomNumberGeneratorStateProvider =
    StateProvider((ref) => randomNumberGenerator());

final attemptRemainingStateProvider =
    StateProvider((ref) => AppConfig.totalAttempt);

final currentScoreStateProvider = StateProvider((ref) => 0);

final showWinCardProvider = StateProvider((ref) => true);

final showResetStateProvider = StateProvider((ref) => false);

final letsStartGameWidgetProvider = StateProvider((ref) => true);
