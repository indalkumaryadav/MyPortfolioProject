import 'dart:async';
import 'package:todo_app/bloc/counter_event.dart';

class CounterBloc{
  int _counter=0;

  final _stateStreamController=StreamController<int>();
  StreamSink<int> get _counterSink=> _stateStreamController.sink;
  Stream<int> get conterStream => _stateStreamController.stream;


  final _eventStreamController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get eventSink=> _eventStreamController.sink;
  Stream<CounterEvent> get _eventStream => _eventStreamController.stream;


  CounterBloc(){
    _eventStreamController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event){

    if(event is Increment){
      _counter++;
    }
    else if(event is Decrement){
      _counter--;
    }
    _counterSink.add(_counter);

  }

  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }


}