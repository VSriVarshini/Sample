import 'package:flutter/material.dart';


import 'CalculatorButtons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget
  {
  const Calculator({super.key});

    @override
  State<Calculator> createState()=>_CalculatorState();

  }
class _CalculatorState extends State<Calculator>
{
  String out="0";
//  String txt="0";
  @override
  Widget build(context)
  {
    return  Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blueGrey,
                    Colors.blueAccent,
                  ],
                )
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
           //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               const SizedBox(height: 30),
                Container(

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 8,
                      ), //Border.all
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text(
                      out,
                      style:const TextStyle(
                          fontWeight: FontWeight.w500,color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                      Text(
                        txt,
                        style: const TextStyle(
                            fontWeight: FontWeight.w100,color: Colors.black,
                          fontSize: 50.0,
                        ),
                      ),
                    ]
                    )
                  ),
                 // width:100,
                 // height:100,
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               const  Expanded(child:
             Padding(padding: EdgeInsets.fromLTRB(25, 25,80, 25),)
                  )
                ,
                  Expanded(child:
                  Padding(padding:const EdgeInsets.all(25),child:  Container(
                      decoration: BoxDecoration(
                          color:Colors.grey,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding( padding:const EdgeInsets.all(10.0),child:
                      ElevatedButton.icon(
                        onPressed:(){ backbtn(txt,out);},
                        icon: const Icon(Icons.arrow_left,color: Colors.black,),
                        label:const Text(""),
                      )))),
                    //back icon
                  )
                ],
              ), Row(

                 // crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 custButton('C'),
                      custButton('()'),
                      custButton('%'),
                      custButton('/'),
                ]),
              Row(

                    children: [
                      custButton('7'),
                      custButton('8'),
                      custButton('9'),
                      custButton('X'),

                    ]),
                  Row(

                  children: [
                    custButton('4'),
                    custButton('5'),
                    custButton('6'),
                    custButton('-'),

                  ]),
               Row(

                  children: [
                    custButton('1'),
                    custButton('2'),
                    custButton('3'),
                    custButton('+'),

                  ]),
               Row(

                  children: [
                    custButton('0'),
                    custButton('.'),
                    custButton('~/'),
                    custButton('='),
              ]),
            ]),
          ),
    );
  }
  late double res;
  late double f,s;
  String hist="";
  String? opr;
  String txt="0";
 void btnclick( String btnval )
  {
 //print(opr);

    if(btnval!="()"&& btnval!="=") {
      hist += btnval;
   }

    if(btnval=="C")
    {
      print(txt);
      hist="0";
      res = 0;
      txt ="0";
      f =0;
      s = 0;
      opr=" ";

    }
//else if(txt!="0"&& txt!=""){
    else if (btnval == "+" ||
        btnval == "-" ||
        btnval == "X" ||
        btnval == "/"|| btnval=="%"||btnval=="~/") {
      if(txt.length!=0&&txt!="0") {
        f = double.parse(txt);
        txt = "0";
        opr = btnval;
   //     hist += btnval;
        print(f);
        print(opr);
      }
      else
        {
          const snackbar=SnackBar(content: Text("Enter a valid number"));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
    }
   // }
  else if (btnval == "=") {

      s = double.parse(txt);
      print(s);
      if (opr == "+") {
        res = f + s;
      }
      if (opr == "-") {
        res = f - s;
      }
      if (opr == "X") {
        res = f * s;
      }
      if (opr == "/") {
        res = (f / s) as double;
      }
      if (opr == "%") {
        res = f % s;
      }
      if (opr == "~/") {
        res = (f ~/ s) as double ;
      }
      txt=res.toString();
    }
else
  {
    if(btnval=="()" )
    {
      print("snack");
      const snackbar=SnackBar(content: Text("Not Working!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    else
      {
        if(txt=="0")
          {
            txt="";
            txt += btnval;
          }
        else {

          txt += btnval;
        }
      }
    print("History $hist");
  }
  /*void btnclick(String btnval)
  {

switch(btnval)
{
  case "C":
    {
      hist="0";
      res = 0;
      txt ="0";
      f =0;
      s = 0;
      opr=" ";
    }
  case "()":
    {
      const snackbar=SnackBar(content: Text("Not Working!"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  case "+"||"-":
    {
      f = double.parse(txt);
      txt = "0";
      opr = btnval;
    }
  case "=":
    {
      s = double.parse(txt);
      // print(s);
      if (opr == "+") {
        res = f + s;
      }
      if (opr == "-") {
        res = f - s;
      }
      if (opr == "X") {
        res = f * s;
      }
      if (opr == "/") {
        res = (f / s) as double;
      }
      if (opr == "%") {
        res = f % s;
      }
      if (opr == "~/") {
        res = (f ~/ s) as double ;
      }
      txt=res.toString();
    }
  default:
    {
      txt += btnval;
    }
    hist += btnval;
}*/
setState(() {
  txt=txt;
  out=hist;
});
  }

Widget custButton (String btnval)
{
  return Expanded(  //child:Padding(padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Padding( padding: EdgeInsets.all(2),
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
             backgroundColor: Colors.grey,
            minimumSize: Size(30, 110)
          ),
    onPressed: (){
     btnclick(btnval);
    },
    child:Padding(padding:const EdgeInsets.all(5),child: Text(btnval,style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold,
          color: Colors.black
    ),)),
  ),
      ));
}
 /* late String val1,val2;
  late int l1,l2;
void backbtn(String back1,String back2)
{
  l1=back1.length;
  val1=back1.substring(0,l1-1);
  l2=back2.length;
  val2=back2.substring(0,l2-1);
  setState(() {
txt=val1;
out=val2;
  });
}*/
  late String val1;
  late int l1;
  void backbtn(String back1,String back2) {
    l1 = back1.length;
    val1 = back1.substring(0, l1 - 1);
    //l2 = back2.length;
//    val2 = back2.substring(0, l2 - 1);
    setState(() {
      txt = val1;
    //  out = val2;
    });
  }
}