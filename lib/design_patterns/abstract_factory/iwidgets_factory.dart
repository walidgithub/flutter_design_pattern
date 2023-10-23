import 'widgets/iactivity_indicator.dart';
import 'widgets/islider.dart';
import 'widgets/iswitch.dart';

/*
why abstract interface ?????
The most common use for the interface modifier is to define a pure interface.
 Combine the interface and abstract modifiers for an abstract interface class .
 Like an interface class, other libraries can implement, but cannot inherit, a pure interface.
 */
abstract interface class IWidgetsFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}
