import 'package:desafio_flutter/app/controller/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<UsuarioController> {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Desafio',
                      style: TextStyle(
                        fontSize: 60.0,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CircleAvatar(
                        backgroundImage:
                            ExactAssetImage('assets/imagens/usuario.png'),
                        minRadius: 75,
                        maxRadius: 100),
                    TextField(
                      onChanged: controller.setUsuarioLogin,
                      decoration: const InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return TextFormField(
                        onChanged: controller.setSenhaLogin,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                            errorText: controller.erroLogin.value),
                      );
                    }),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.verificaLogin()) Get.toNamed('/home');
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
