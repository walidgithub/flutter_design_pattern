import 'package:flutter/material.dart';

import '../istate.dart';
import '../state_context.dart';
import 'loading_state.dart';

class LoadedState implements IState {
  // after we calling loaded state we will get a list from data
  const LoadedState(this.names);

  final List<String> names;

  // StateContext is the class that we need to add state or alter state or dispose
  @override
  Future<void> nextState(StateContext context) async {
    // it is next state if need
    // calling loading state to try getting data again
    context.setState(const LoadingState());
  }

  @override
  Widget render() {
    return Column(
      children: names
          .map(
            (name) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  child: Text(name[0]),
                ),
                title: Text(name),
              ),
            ),
          )
          .toList(),
    );
  }
}
