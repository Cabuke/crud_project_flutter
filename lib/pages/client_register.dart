
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/controller/client_controller.dart';
import 'package:flutter_app/components/alert_widget.dart';
import 'package:flutter_app/pages/client_list.dart';
import 'package:line_icons/line_icon.dart';

class ClientRegister extends StatefulWidget {
  const ClientRegister({super.key});

  @override
  State<ClientRegister> createState() => _ClientRegisterState();
}

class _ClientRegisterState extends State<ClientRegister> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // CREATE USER

  TextEditingController nameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  TextEditingController tagControl = TextEditingController();

  Future<void> createClient(BuildContext context, VoidCallback onSucess) async {
    String name = nameControl.text;
    String email = emailControl.text;
    String tag = tagControl.text;

    // Chamada da API para criar usuário
    await ClientController.createClient(
      name,
      email,
      tag,
    );
    onSucess.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/catUser.png'),
                      scale: 2,
                    ),
                  ),
                ),
                FadeInUp(
                  from: 150,
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          height: 69,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0XFFF6F6F6),
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 11) // changes position of shadow
                                    ),
                              ]),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: nameControl,
                              decoration: const InputDecoration(
                                icon: LineIcon.user(),
                                hintText: 'Digite seu nome',
                                border: InputBorder.none,
                              ),
                              validator: (String? value) {
                                return (value != null && value.isEmpty)
                                    ? 'Digite um nome'
                                    : null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          height: 69,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0XFFF6F6F6),
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 11) // changes position of shadow
                                    ),
                              ]),
                          child: Align(
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: emailControl,
                              decoration: const InputDecoration(
                                icon: LineIcon.mailBulk(),
                                hintText: 'Digite seu e-mail',
                                border: InputBorder.none,
                              ),
                              onSaved: (String? value) {
                                // This optional block of code can be used to run
                                // code when the user saves the form.
                              },
                              validator: (String? value) {
                                return (value != null && value.isEmpty)
                                    ? 'Digite um email!'
                                    : null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          height: 69,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color(0XFFFFFFFF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0XFFF6F6F6),
                                    blurRadius: 5,
                                    offset: Offset(0, 11)),
                              ]),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 300,
                              child: TextFormField(
                                // autofocus: true,
                                controller: tagControl,
                                decoration: const InputDecoration(
                                  icon: LineIcon.sun(),
                                  hintText: 'Digite uma tag',
                                  border: InputBorder.none,
                                ),
                                validator: (String? value) {
                                  return (value != null && value.isEmpty)
                                      ? 'Digite uma tag.'
                                      : null;
                                },
                                onChanged: (value) {
                                  // if (value.isNotEmpty) {
                                  //   setState(() {
                                  //     tagControl.clear();
                                  //   });
                                  // }
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        FadeInDown(
                          from: 100,
                          child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                createClient(context, () {
                                  if (mounted) {
                                    customAlert(
                                      context,
                                      actions: <Widget>[
                                        Center(
                                          child: TextButton(
                                            style: const ButtonStyle(
                                              alignment: Alignment.center,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ClientList(),
                                                ),
                                              );
                                            },
                                            child: const Text('Fechar'),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    customAlert(
                                      context,
                                      title: const Text(
                                        'Error!',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      icon: const LineIcon.closedCaptioning(
                                        size: 18,
                                        color: Colors.red,
                                      ),
                                      content: const Text(
                                        'Não foi possível criar um novo Cliente no momento, tente novamente mais tarde!',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    );
                                  }
                                });
                              }
                            },
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: const Color(0XFF7957F3),
                              ),
                              child: const Center(
                                child: Text(
                                  "Cadastrar!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FadeInUp(
                            from: 150,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const ClientList(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: const Color(0XFF7957F3),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Listar seus clientes",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
