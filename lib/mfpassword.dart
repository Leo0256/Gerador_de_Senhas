import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class MFPassword extends StatefulWidget {
  const MFPassword({ Key? key }) : super(key: key);
  
  get color => Colors.indigo[400];

  @override
  State<MFPassword> createState() => _MFPasswordState();
}

class _MFPasswordState extends State<MFPassword> {
  bool _hasUpper = true;
  bool _hasLower = true;
  bool _hasSpecial = true;
  bool _hasNumber = true;

  void _toggleUpper(bool value) => setState(() => 
    _hasLower || _hasSpecial || _hasNumber
      ? _hasUpper = value : null
  );
  void _toggleLower(bool value) => setState(() => 
    _hasUpper || _hasSpecial || _hasNumber
      ? _hasLower = value : null
  );
  void _toggleSpecial(bool value) => setState(() => 
    _hasUpper || _hasLower || _hasNumber
      ? _hasSpecial = value : null
  );
  void _toggleNumber(bool value) => setState(() => 
    _hasUpper || _hasLower || _hasSpecial
      ? _hasNumber = value : null
  );
  
  double _range = 15;
  String _pass = '';

  // gerador de senhas
  void genPass() {
      List<String> charList = <String>[
        _hasUpper ? 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' : '',
        _hasLower ? 'abcdefghijklmnopqrstuvwxyz' : '',
        _hasNumber ? '0123456789' : '',
        _hasSpecial ? '!@#\$%&*-=+,.<>;:/?' : ''
      ];
      
      final String chars = charList.join('');

      Random rnd = Random();
      _pass = String.fromCharCodes(Iterable.generate(
        _range.round() - 2,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length))
      ));

      if(_hasUpper) {
        setState(() => _pass = 'MF$_pass');
      } else {
        setState(() => _pass = 'mf$_pass');
      }
      
      //teste
      Clipboard.setData(ClipboardData(text: _pass));
  }

  @override
  Widget build(BuildContext context) {

    Row _option(bool isSelected, String label, Function(bool) toggle) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 24,
              color: widget.color
            ),
          ),
          Switch(
            value: isSelected,
            onChanged: toggle,
            activeColor: widget.color,
            activeTrackColor: Colors.grey,
            splashRadius: 20,
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerador de Senhas', style: TextStyle(color: Colors.black),),
        backgroundColor: widget.color,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 16),
                child: Text(
                  'Defina as Características',
                  style: TextStyle(
                    fontSize: 24,
                    color: widget.color,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _option(_hasLower, 'Minúscula', _toggleLower),
                    _option(_hasUpper, 'Maiúscula', _toggleUpper),
                    _option(_hasSpecial, 'Especiais', _toggleSpecial),
                    _option(_hasNumber, 'Números', _toggleNumber),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Tamanho: ${_range.round()}',
                        style: TextStyle(
                          fontSize: 24,
                          color: widget.color
                        ),
                      )
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 16/* 16 */,
                      child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          overlayShape: SliderComponentShape.noOverlay,
                        ),
                        child: Slider(
                          value: _range,
                          max: 18,
                          min: 4,
                          activeColor: widget.color,
                          inactiveColor: Colors.grey,
                          onChanged: (newRange) {
                            setState(() {
                              _range = newRange;
                            });
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(32),
                child: 
                  TextButton(
                    onPressed: genPass,
                    style: TextButton.styleFrom(
                      primary: widget.color,
                      backgroundColor: Colors.grey[300],
                      textStyle: const TextStyle(
                        fontSize: 20
                      )
                    ),
                    child: const Text('Gerar senha')
                  )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  _pass,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                )
              )
            ],
          )
        ],
      )
    );
  }
}