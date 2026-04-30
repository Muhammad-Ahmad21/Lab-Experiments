import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  final String? todayMood; // 'Good' or 'Not Good'

  HomeState({this.todayMood});

  HomeState copyWith({String? todayMood}) {
    return HomeState(todayMood: todayMood ?? this.todayMood);
  }
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  void setMood(String mood) {
    state = state.copyWith(todayMood: mood);
  }
}

final homeViewModelProvider = StateNotifierProvider<HomeNotifier, HomeState>((
  ref,
) {
  return HomeNotifier();
});
