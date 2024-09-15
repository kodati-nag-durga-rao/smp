import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smp/second_screen.dart';
import 'package:smp/update_state.dart';

import 'global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => UpdateState())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<int> dataList = [1,2,3];


  void _incrementCounter() {
    setState(() {
      //  _counter++;
      dataList1.add(dataList1.last+1);
    });
  }

  @override
  Widget build(BuildContext context) {

    print("-------Build method called first-------");

    return Consumer<UpdateState>(
      builder: (context,value,child) {
        return Scaffold(
          appBar: AppBar(

            backgroundColor: Theme.of(context).colorScheme.inversePrimary,

            title: Text(widget.title),
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
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                // color: Colors.yellow,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.dataList.length,
                    itemBuilder: (context,index){
                      return Text(value.dataList[index].toString(),style: TextStyle(fontSize: 20),);
                    }),
              )

            ],
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "Navigation",
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen(
                    secListData: dataList,
                  )));
                },
                tooltip: 'Increment',
                child: const Icon(Icons.send),
              ),
              const SizedBox(width: 20,),
              FloatingActionButton(
                heroTag: "Increment",
                onPressed: (){
                  value.updateList();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 20,),
              FloatingActionButton(
                heroTag: "decr",
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
