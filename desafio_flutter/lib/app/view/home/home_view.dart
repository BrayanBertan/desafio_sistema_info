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
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cadastro',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35),
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              onChanged: homeController.setNome,
              controller: homeController.nomeController,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  errorText: homeController.nomeErroMensagem()),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              onChanged: homeController.setCpf,
              controller: homeController.cpfController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              decoration: InputDecoration(
                labelText: 'CPF',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.document_scanner),
                errorText: homeController.cpfErroMensagem(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: homeController.enderecoController,
              onChanged: homeController.setendereco,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Endereço',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.add_location),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: homeController.telefoneController,
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
            ),
            const SizedBox(
              height: 15.0,
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
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
                  ),
                  ElevatedButton(
                    onPressed: () => homeController.limparFormulario(),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              );
            }),
            Obx(() {
              return Text(homeController.mensagemRetornoCadastro.value);
            }),
            const SizedBox(
              height: 20.0,
            ),
            ExpansionTile(
              title: const Text(
                'Usuários',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              children: [
                Obx(() {
                  return Container(
                    height: 200,
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: homeController.usuarios.value
                          .map((usuario) => ListTile(
                                leading: Text('${usuario.codigo}'),
                                title: Text(usuario.nome ?? ''),
                                trailing: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            homeController.setEditar(usuario);
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.yellow,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            homeController.deletarUsuario(
                                                usuario.codigo!);
                                          },
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: Colors.redAccent,
                                          ))
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
