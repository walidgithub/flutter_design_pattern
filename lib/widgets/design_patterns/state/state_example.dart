import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../design_patterns/state/state.dart';
import '../../platform_specific/platform_button.dart';

class StateExample extends StatefulWidget {
  const StateExample();

  @override
  _StateExampleState createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample> {
  // first state is no result
  final _stateContext = StateContext();

  // calling nextState if loading will get data else other (loaded - ...) they will call loading data again
  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          children: <Widget>[
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeState,
              text: 'Load names',
            ),
            const SizedBox(height: LayoutConstants.spaceL),
            StreamBuilder<IState>(
              // we start with initial data it is no result state
              initialData: const NoResultsState(),
              // get carried data from inState
              stream: _stateContext.outState,
              // render the widget from called state
              builder: (context, snapshot) => snapshot.data!.render(),
            ),
          ],
        ),
      ),
    );
  }
}
