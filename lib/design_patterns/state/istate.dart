import 'package:flutter/widgets.dart';

import 'state_context.dart';

// in state pattern every state can call the next state
abstract interface class IState {
  Future<void> nextState(StateContext context);
  Widget render();
}
