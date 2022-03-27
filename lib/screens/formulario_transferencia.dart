import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';
import 'lista_transferencia.dart';

const _tituloAppBar = 'Criando Transferencias';
class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.parse(_controladorCampoNumeroConta.text);
    final double valor = double.parse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: 'Numero da conta',
                dica: '0000'),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text('teste'),
              onPressed: () {
                _criaTransferencia(context);
                ;
              },
            )
          ],
        ),
      ),
    );
  }
}
