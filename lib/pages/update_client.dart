import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/controller/client_controller.dart';
import 'package:flutter_app/api/models/clients_model.dart';
import 'package:flutter_app/components/alert_widget.dart';
import 'package:flutter_app/pages/client_list.dart';
import 'package:line_icons/line_icon.dart';

class UpdateClient extends StatefulWidget {
  final ClientsModel client;

  const UpdateClient({
    super.key,
    required this.client,
  });

  @override
  State<UpdateClient> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UpdateClient> {
  late TextEditingController newName;
  late TextEditingController newEmailControl;
  late TextEditingController newTagControl;
  late TextEditingController currentId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newName = TextEditingController(text: widget.client.name);
    newEmailControl = TextEditingController(text: widget.client.email);
    newTagControl = TextEditingController(text: widget.client.tag);
    currentId = TextEditingController(text: widget.client.id);
  }

  final ClientController _controller = ClientController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateUser(BuildContext context, VoidCallback onSucess) async {
    String id = currentId.text;
    String name = newName.text;
    String email = newEmailControl.text;
    String tag = newTagControl.text;

    await _controller.updateClient(
      id,
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
                const Text(
                  'Atualize os dados do seu cliente!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                              controller: newName,
                              decoration: const InputDecoration(
                                icon: LineIcon.user(),
                                hintText: 'Digite um novo nome',
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
                              controller: newEmailControl,
                              decoration: const InputDecoration(
                                icon: LineIcon.mailBulk(),
                                hintText: 'Digite um novo e-mail',
                                border: InputBorder.none,
                              ),
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
                                // initialValue: widget.client.tag,
                                controller: newTagControl,
                                decoration: const InputDecoration(
                                  icon: LineIcon.sun(),
                                  hintText: 'Digite uma nova tag',
                                  border: InputBorder.none,
                                ),
                                validator: (String? value) {
                                  return (value != null && value.isEmpty)
                                      ? 'Digite uma tag.'
                                      : null;
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        FadeInUp(
                          from: 100,
                          child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                updateUser(context, () {
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
                                  "Atualizar!",
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
                          height: 30,
                        ),
                        FadeInUp(
                          from: 100,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0XFF7957F3),
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  color: const Color(0XFFFFFFFF),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0XFFF6F6F6),
                                        blurRadius: 5,
                                        offset: Offset(0, 11)),
                                  ]),
                              child: const Center(
                                child: Text(
                                  "Voltar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0XFF7957F3),
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

  @override
  void dispose() {
    newName.dispose();
    newEmailControl.dispose();
    newTagControl.dispose();
    currentId.dispose();

    super.dispose();
  }
}
