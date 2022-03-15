import 'package:brasil_fields/brasil_fields.dart';
import 'package:desafio_flutter/app/controller/usuario_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.find<UsuarioController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Cadastro',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Obx(() {
              return TextFormField(
                onChanged: homeController.setNome,
                initialValue: homeController.nome.value,
                decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    errorText: homeController.nomeErroMensagem()),
              );
            }),
            const SizedBox(
              height: 10.0,
            ),
            Obx(() {
              return TextFormField(
                onChanged: homeController.setCpf,
                initialValue: homeController.cpf.value,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                decoration: InputDecoration(
                  labelText: 'CPF',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.document_scanner),
                  errorText: homeController.cpfErroMensagem(),
                ),
              );
            }),
            const SizedBox(
              height: 10.0,
            ),
            Obx(() {
              return TextFormField(
                initialValue: homeController.endereco.value,
                onChanged: homeController.setEndereco,
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.add_location),
                ),
              );
            }),
            const SizedBox(
              height: 10.0,
            ),
            Obx(() {
              return TextFormField(
                initialValue: homeController.telefone.value,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                onChanged: homeController.setTelefone,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              );
            }),
            const SizedBox(
              height: 15.0,
            ),
            Obx(() {
              return ElevatedButton(
                onPressed: homeController.formularioValido()
                    ? () async {
                        homeController.cadastrar().then((value) {});
                      }
                    : null,
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 20.0,
            ),
            ExpansionTile(
              title: Text(
                'Usuários',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    Text('aaaaaaaaaaaa'),
                    Text('aaaaaaaaaaaa'),
                    Text('aaaaaaaaaaaa'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
