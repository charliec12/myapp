import 'package:flutter/material.dart';



class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  String _selectedValue = 'Basic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Options'),
      ),
      backgroundColor: Colors.limeAccent,
      body: Container(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Select response style',
            style: TextStyle(fontSize: 38), textAlign: TextAlign.center,),
            ListTile(
              title: Text('Basic'),
              leading: Radio(
                value: 'basicResponse',
                groupValue: _selectedValue,
                onChanged: _groupChange,
              ),
            ),
            ListTile(
              title: Text('Valley'),
              leading:
                  Radio(value: 'valleyResponse', groupValue: _selectedValue, onChanged: _groupChange),
            ),
            ListTile(
              title: Text('Emoji'),
              leading: Radio(value: 'emojiResponse', groupValue: _selectedValue, onChanged: _groupChange),
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: (){
                String go = '/'+_selectedValue;
                Navigator.pushNamed(context, go);
              },
            ),
            //Text(_selectedValue)
          ],
        ),
      ),
    );
  }

  void _groupChange(String value){
    setState((){_selectedValue = value;});
  }

}

