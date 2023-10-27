import 'dart:async';

import 'istate.dart';
import 'states/loading_state.dart';
import 'states/no_results_state.dart';

class StateContext {
  // StreamController<IState> is listener with type IState
  final _stateStream = StreamController<IState>();
  // StreamController need to add Sink >> it is an input with type IState
  Sink<IState> get _inState => _stateStream.sink;
  // StreamController need to add Stream >> it is an output with type IState
  Stream<IState> get outState => _stateStream.stream;

  // current state (loading - loaded - error - no result)
  late IState _currentState;

  // first run for StateContext will return current state is NoResultsState then add state to stream
  StateContext() {
    _currentState = const NoResultsState();
    _addCurrentStateToStream();
  }

  void dispose() {
    _stateStream.close();
  }

  // add current State >> into Stream
  void setState(IState state) {
    _currentState = state;
    _addCurrentStateToStream();
  }

  void _addCurrentStateToStream() {
    // _inState will carry the data
    _inState.add(_currentState);
  }

  // alter State >> into Stream
  Future<void> nextState() async {
    // here we will call nextState function to to alter state
    await _currentState.nextState(this);

    if (_currentState is LoadingState) {
      // if loading state we need to fire function nextSate to return data and go to next state
      // loading state need to be altered by next state like error or loaded and stop after getting data
      await _currentState.nextState(this);
    }
  }
}
