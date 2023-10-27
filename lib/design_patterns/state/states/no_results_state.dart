import 'package:flutter/material.dart';

import '../istate.dart';
import '../state_context.dart';
import 'loading_state.dart';

class NoResultsState implements IState {
  const NoResultsState();

  // StateContext is the class that we need to add state or alter state or dispose
  @override
  Future<void> nextState(StateContext context) async {
    // it is next state if need
    // calling loading state to try getting data again
    context.setState(const LoadingState());
  }

  @override
  Widget render() {
    return const Text(
      'No Results',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}
