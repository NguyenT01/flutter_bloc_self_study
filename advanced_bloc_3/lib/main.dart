import 'remote_bloc.dart';
import 'remote_event.dart';
import 'remote_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const  MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //DO SOMETHING HERE
  final bloc = RemoteBloc();

  @override
  void dispose(){
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: StreamBuilder<RemoteState>(
            stream: bloc.stateController.stream,
            initialData: bloc.state,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              return Text('Current volume is: ${snapshot.data?.value}');
            },
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ()=> {bloc.eventController.add(IncreaseEvent(5))},
            child: Icon(Icons.volume_up),
          ),
          FloatingActionButton(
            onPressed: () => {bloc.eventController.add(DecreaseEvent(5))},
            child: Icon(Icons.volume_down),
          ),
          FloatingActionButton(
            onPressed: ()=> {bloc.eventController.add(MutedEvent())},
            child: Icon(Icons.volume_mute),
          )
        ],
      ),
    );
  }
}
