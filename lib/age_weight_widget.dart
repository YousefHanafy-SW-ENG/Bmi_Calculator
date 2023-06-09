import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {

  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;
  const AgeWeightWidget({Key? key, required this.onChange, required this.title, required this.initValue, required this.min, required this.max}) : super(key: key);

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int counter = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
    child: Card(
    elevation: 12,
    shape: RoundedRectangleBorder(),
    child: Column(
      children: [
        Text(widget.title,style: TextStyle(fontSize: 20,color: Colors.blueAccent,fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                child:  CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.remove,color: Colors.white,),
                ),
                onTap: (){
                    setState(() {
                      if(counter>widget.min){
                        counter--;
                      }
                    });
                    widget.onChange(counter);
                },
              ),
              SizedBox(width: 15,),
              Text(counter.toString(),textAlign: TextAlign.center,style: TextStyle(color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w500),),
              SizedBox(width: 15,),
              InkWell(
                child:  CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.add,color: Colors.white,),
                ),
                onTap: (){
                  setState(() {
                    if(counter<widget.max){
                      counter++;
                    }
                  });
                  widget.onChange(counter);
                },
              ),
            ],
          ),
        ),
      ],
    ),
    ),
    );
  }
}
