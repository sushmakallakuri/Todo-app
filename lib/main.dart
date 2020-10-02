import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "Todo Application"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String, bool> items = new Map<String, bool>();


  TextEditingController controller = new TextEditingController();

  void initState() {
    super.initState();
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
        child: Column(
          children: [

            

            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: 2.0,
                  color: Colors.purple,
                ),
              ),
              child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                    decoration: InputDecoration(
                      hintText: "Enter a Todo",
                    ),
                  ),
                  ),
                ),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.purple,
                  elevation: 8.0,
                child: Icon(Icons.add, color: Colors.white,),
                  onPressed: () {

                    items[controller.text] = false;
                      controller.text = "";
                      setState(() {
                        
                      });
                }),
              ],
            ),
            ),
            ),


            /*


            ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.00)),
                      leading: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 4.0, 4.0, 4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        width: 2.0,
                      ),
                      ),
                    tileColor: Colors.grey.withOpacity(0.5),
                    title: Text(apples[index],textAlign: TextAlign.left,),
                    trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () {

                      apples.removeAt(index);
                      setState(() {

                      });



                    },),
                    ),

                    */


              items.length == 0 ? Center(
                heightFactor: 5.0,
                child: Column(
                  children: [
                    Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    //https://image.flaticon.com/icons/png/512/15/15457.png
                    image: AssetImage("assets/emptybox.png"),
                  ),
                ),
              ),

              Text("Nothing to see here", textAlign: TextAlign.center,)
                  ],
                ),
              ) : Expanded(
                child: 
ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: false,
                
              shrinkWrap: true,
              itemBuilder: (context, index) {

                var aa = items.keys.toList()[index];
                  return Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 2.0),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      elevation: 8.0,
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Flexible(
                          flex: 1,
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        width: 8.0,
                        height: 48.0,
                      
                      ),
                      ),
                        ),



                    Flexible(
                      fit: FlexFit.tight,
                      flex: 10,
                      child: 
                      Text(aa, overflow: TextOverflow.visible,),
                    ),



                      


                      Flexible(
                        flex: 2,
                        child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Checkbox(
                          value: items.values.toList()[index],
                          onChanged: (value) {
                            items[aa] = value;
                            setState(() {
                              
                            });
                          },
                        ),
                      ),
                      ),


                      
                      ],
                    ),
                    ),
                  );
            },
            itemCount: items.length,
            ),
              ),


          ],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          items.removeWhere((key, value) => value);

      setState(() {
        
      });


        },
        tooltip: 'reload',
        child: Icon(Icons.delete_sweep),
      ),
    );
  }
}
