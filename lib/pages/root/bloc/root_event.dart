abstract class RootEvent {
  const RootEvent();
}

class SelectedPageChangedEvent extends RootEvent {
  final int index;
  const SelectedPageChangedEvent(this.index) : super();
}
