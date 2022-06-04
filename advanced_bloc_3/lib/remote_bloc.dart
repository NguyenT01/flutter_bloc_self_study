import 'dart:async';
import 'remote_event.dart';
import 'remote_state.dart';

class RemoteBloc{
  var state = RemoteState(70);

  final eventController = StreamController<RemoteEvent>();
  final stateController = StreamController<RemoteState>();

  RemoteBloc(){
    eventController.stream.listen((RemoteEvent event) {
      if(event is IncreaseEvent){
        state = RemoteState(state.value + event.increment);
      }
      else if(event is DecreaseEvent){
        state = RemoteState(state.value - event.decrease);
      }
      else{
        state = RemoteState(0);
      }

      stateController.sink.add(state);

    });
  }

  dispose() {
    eventController.close();
    stateController.close();
  }
}












































// import 'dart:async';
//
// import 'remote_event.dart';
// import 'remote_state.dart';
//
// class RemoteBloc{
//   var state = RemoteState(70);
//
//   final eventController = StreamController<RemoteEvent>();
//
//   final stateController = StreamController<RemoteState>();
//
//   RemoteBloc(){
//     eventController.stream.listen((RemoteEvent event) {
//       if(event is IncreaseEvent){
//         state = RemoteState(state.volume + event.increment);
//       }
//       else if(event is DecreaseEvent){
//         state = RemoteState(state.volume - event.decrement);
//       }
//       else{
//         state = RemoteState(0);
//       }
//
//       stateController.sink.add(state);
//     });
//   }
//
//   void dispose(){
//     stateController.close();
//     eventController.close();
//   }
// }

