abstract class RemoteEvent{}

class IncreaseEvent extends RemoteEvent{
  IncreaseEvent(this.increment);

  final int increment;
}

class DecreaseEvent extends RemoteEvent{
  DecreaseEvent(this.decrease);

  final int decrease;
}

class MutedEvent extends RemoteEvent{

}















































// abstract class RemoteEvent{}
//
// class IncreaseEvent extends RemoteEvent{
//   IncreaseEvent(this.increment);
//
//   final int increment;
// }
//
// class DecreaseEvent extends RemoteEvent{
//   DecreaseEvent(this.decrement);
//
//   final int decrement;
// }
//
// class MutexEvent extends RemoteEvent{
//
// }
