import 'package:flutter/material.dart';

import '../fake_api.dart';
import '../istate.dart';
import '../state_context.dart';
import 'error_state.dart';
import 'loaded_state.dart';
import 'no_results_state.dart';

class LoadingState implements IState {
  // once we call loading state it will try to get data
  const LoadingState({
    this.api = const FakeApi(),
  });

  final FakeApi api;

  // StateContext is the class that we need to add state or alter state or dispose
  @override
  Future<void> nextState(StateContext context) async {
    try {
      final resultList = await api.getNames();

      // here we will alter state by loaded or error or no result
      // if state is LoadedState we will send list of data with it
      context.setState(
        resultList.isEmpty ? const NoResultsState() : LoadedState(resultList),
      );
    } on Exception {
      context.setState(const ErrorState());
    }
  }

  @override
  Widget render() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    );
  }
}
