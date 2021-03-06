import 'package:ExtensionaIF/components/TextAreaEditor.dart';
import 'package:ExtensionaIF/components/SimpleTextEditor.dart';
import 'package:flutter/material.dart';
import 'package:ExtensionaIF/models/demanda.dart';

class FormDemanda extends StatelessWidget {

  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerTempo = TextEditingController();
  final TextEditingController _controllerResumo = TextEditingController();
  final TextEditingController _controllerObjetivo = TextEditingController();
  final TextEditingController _controllerContrapartida = TextEditingController();
  final TextEditingController _controllerVinculo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Nova Demanda")),
      body: SingleChildScrollView(
        child: Column (
          children: [
            SimpleTextEditor(_controllerTitulo, 'Título', 'Dê um nome para esta demanda', Icons.title),
            SimpleTextEditor(_controllerTempo, 'Tempo', 'Número de meses para ser realizada', Icons.timer_outlined),
            TextAreaEditor(_controllerResumo, 'Resumo', 'Escreva um resumo do que será o projeto', Icons.message_outlined),
            TextAreaEditor(_controllerObjetivo, 'Objetivo', 'Qual o objetivo do projeto?', Icons.control_point),
            TextAreaEditor(_controllerContrapartida, 'Contrapartida', 'Qual o envolvimento da comunidade na proposta?', Icons.content_paste),
            SimpleTextEditor(_controllerVinculo, 'Vínculo', 'Qual o seu vínculo com a entidade parceira?', Icons.insert_link),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0, bottom: 40.0),
              child: ElevatedButton(
                  onPressed: () {
                    _createDemanda(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Cadastrar Nova Demanda', style: TextStyle(fontSize: 18.0)),
                      Icon(Icons.add),
                    ],
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.blueAccent,
                          width: 1.0,
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ],
        )
      ),
    );
  }

  void _createDemanda(BuildContext context) {
    print('Clicou no botão de cadastrar');

    final demandaCriada = Demanda(_controllerTitulo.text, DateTime.now(), _controllerTempo.text,
                                  _controllerResumo.text,'C', _controllerObjetivo.text,
                                  _controllerContrapartida.text, _controllerVinculo.text);
    debugPrint('Demanda criada: $demandaCriada');

    Navigator.pop(context, demandaCriada);

    final SnackBar snackBar = SnackBar(content: Text('Demanda criada com sucesso!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
