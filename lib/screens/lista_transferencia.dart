import 'package:flutter/material.dart';

import '../models/transferencia.dart';
import 'formulario_transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _tranferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencias'),
      ),
      body: ListView.builder(
        itemCount: widget._tranferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._tranferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) {
            _atualizacao(transferenciaRecebida);

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualizacao(Transferencia? transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._tranferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transfencia;

  ItemTransferencia(this._transfencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfencia.valor.toString()),
      subtitle: Text(_transfencia.numeroConta.toString()),
    ));
  }
}
