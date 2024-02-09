import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

 var wtController= TextEditingController();
 var ftController=  TextEditingController();
 var inController= TextEditingController();
 var result = "";
 var bgColor = Colors.indigo.shade200;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Center(child: Text('yourBMI')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            color:bgColor,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),),


                SizedBox(
                  height: 21,
                ),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight'),
                    prefix: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 11,
                ),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height'),
                    prefix: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(
                  height: 11,
                ),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height(inch)'),
                    prefix: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                ElevatedButton(onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if (wt != "" && ft != "" && inch != "") {

                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);


                    var tInch = (ift*12) + iInch;
                    var tCm = tInch*2.54;

                    var tM = tCm/100;

                    var bmi = iwt/(tM*tM);

                    var msg = "";

                    if(bmi>25){
                      msg = "You're overweight";
                      bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "You're overweight";
                      bgColor = Colors.red.shade200;
                    }else{
                      msg="You're Healthy";
                      bgColor = Colors.green.shade200;


                    }

                    setState(() {
                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";

                    });

                  } else {
                    setState(() {
                      result = "Please fill all the required blanks!";
                    });
                  }
                },




                    child: Text('Calculator')
                ),

                SizedBox(
                  height: 11,
                ),
                Text(result,style:  TextStyle(fontSize: 19),),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
