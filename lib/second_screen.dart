import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smp/update_state.dart';

import 'global.dart';

class SecondScreen extends StatefulWidget {
  List? secListData;
   SecondScreen({super.key,this.secListData});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


  void _incrementCounter() {
    setState(() {
      //  _counter++;
      dataList1.add(dataList1.last+1);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("-------Build method called second-------");

    return Consumer<UpdateState>(
      builder: (context,value,child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,

            title: Text("Second screen"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                // _counter.toString(),
                value.dataList.last.toString(),
               // widget.secListData!.last.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                // color: Colors.yellow,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.dataList.length,
                    itemBuilder: (context,index){
                      return Text(value.dataList[index].toString(),style: const TextStyle(fontSize: 20),);
                    }),
              )

            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "increment",
                onPressed: (){
                  value.updateList();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 20,),
              FloatingActionButton(
                heroTag: "decrement",
                onPressed: (){
                  value.decrementList();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.remove),
              ),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }
    );
  }
}
