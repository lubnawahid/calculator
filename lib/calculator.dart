import 'package:flutter/material.dart';
class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Container(
           height: 250,
            decoration: BoxDecoration(
              color: Colors.white,

            ),
            alignment: Alignment.bottomRight,

            child: Column(
              children: [
                SizedBox(height: 70,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(history,textAlign: TextAlign.right,style: TextStyle(fontSize: 50),)),
                SizedBox(height: 40,),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(output,textAlign: TextAlign.right,style: TextStyle(fontSize: 50),)),
              ],
            ),
          ),

          Divider(),
          SizedBox(height: 80,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleAvatar('C', Colors.grey),
                    buildCircleAvatar('<-', Colors.grey),
                    buildCircleAvatar('%', Colors.grey),
                    buildCircleAvatar('/', Colors.orange),
                  ],
                ),
                SizedBox(height: 20,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleAvatar('7', Colors.grey),
                    buildCircleAvatar('8', Colors.grey),
                    buildCircleAvatar('9', Colors.grey),
                    buildCircleAvatar('*', Colors.orange),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleAvatar('4', Colors.grey),
                    buildCircleAvatar('5', Colors.grey),
                    buildCircleAvatar('6', Colors.grey),
                    buildCircleAvatar('-', Colors.orange),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleAvatar('1', Colors.grey),
                    buildCircleAvatar('2', Colors.grey),
                    buildCircleAvatar('3', Colors.grey),
                    buildCircleAvatar('+', Colors.orange),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleAvatar('0', Colors.grey),
                    buildCircleAvatar('.', Colors.grey),
                    buildCircleAvatar('=', Colors.orange),
                  ],

                ),

              ],
            ),
          ),


        ],

      ),
    );
  }
  Container buildContainer(String value,Color clr) {
    return Container(
      height: 70,
      width: 120,
      child: FloatingActionButton.extended(
        onPressed: () {
          btnClicked(value);
          // Add your onPressed code here!
        },
        label: Text(value,style: TextStyle(color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        backgroundColor: clr,
      ),
    );
  }

  CircleAvatar buildCircleAvatar(String value, [Color? backgroundcolor]) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: backgroundcolor ?? Colors.white,
      child: TextButton(
        onPressed: () => btnClicked(value),
        child: Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        //onPressed: (){},
      ),
    );
  }

  String output = "0";
  String history = '';
  String result = "";
  int num1 = 0;
  int num2 = 0;
  String operand = "";

  void btnClicked(String btnText) {
    if (btnText == "C") {
      result = "";
      history = '';
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else if(btnText == "<-"){
      setState(() {
        if(result.length == 1){
          result = "0";

        }
        else {
          result = result.substring(0,result.length - 1);
        }
      });
    }
    else if (btnText == "+" || btnText == "-" || btnText == "*" || btnText == "/" || btnText == "%") {
      num1 = int.parse(output);
      operand = btnText;
      result = "";
    }
    else if (btnText == "."){
      if(result.contains(".")){
        print("Already contains a decimals");
        return;

      }
      else{
        result = result + btnText;
      }
    }
    else if (btnText == "=") {
      num2 = int.parse(output);
      if (operand == "+") {
        result = (num1 + num2).toString();
        history = num1.toString() +operand.toString()+ num2.toString();
      }
      if (operand == "-") {
        result = (num1 - num2).toString();
        history = num1.toString() +operand.toString()+ num2.toString();
      }
      if (operand == "*") {
        result = (num1 * num2).toString();
        history = num1.toString() +operand.toString()+ num2.toString();
      }
      if (operand == "/") {
        result = (num1 / num2).toString();
        history = num1.toString() +operand.toString()+ num2.toString();
      }
      if (operand == "%") {
        result = (num1 % num2).toString();
        history=num1.toString() + operand.toString() +num2.toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    }
      else {
      result = result + btnText;
      }
      print( result);
      setState(() {
        output =  result;
      });
    }
  }



