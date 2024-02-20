import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/controller/client_controller.dart';
import 'package:flutter_app/api/models/clients_model.dart';
import 'package:flutter_app/components/alert_widget.dart';
import 'package:flutter_app/pages/client_register.dart';
import 'package:flutter_app/pages/update_client.dart';
import 'package:line_icons/line_icon.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchClient();
  }

  final ClientController _controller = ClientController();

  List<ClientsModel> _clients = [];

  void _fetchClient() async {
    final clients = await _controller.fetchClients();
    setState(() {
      _clients = clients;
    });
  }

  void setDelete(
    BuildContext context,
    String id,
    VoidCallback onSucess,
  ) async {
    await _controller.deleteClient(id);
    onSucess();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: FadeInUp(
          from: 50,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ClientRegister(),
                ),
              );
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
                  "Cadastrar novo cliente",
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
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _controller.fetchClients(),
          builder: (_, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/error404.png'),
                              scale: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Você não possui nenhum cliente!',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // FadeInUp(
                      //   from: 50,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.of(context).pushReplacement(
                      //         MaterialPageRoute(
                      //           builder: (context) => const ClientRegister(),
                      //         ),
                      //       );
                      //     },
                      //     child: Container(
                      //       height: 60,
                      //       width: MediaQuery.of(context).size.width,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(
                      //           10,
                      //         ),
                      //         color: const Color(0XFF7957F3),
                      //       ),
                      //       child: const Center(
                      //         child: Text(
                      //           "Cadastrar novo cliente",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.w400,
                      //             color: Color(0xffffffff),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: SafeArea(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Lista de clientes!',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: _clients.length,
                          itemBuilder: (context, index) {
                            final client = _clients[index];

                            return Card(
                              child: ListTile(
                                title: Text(
                                  client.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      client.email,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      client.tag,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const LineIcon.trash(
                                    size: 24,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setDelete(context, client.id, () {
                                      if (mounted) {
                                        setState(() {
                                          _fetchClient();
                                        });
                                        customAlert(
                                          context,
                                          content: const Text(
                                            'Cliente deletado com sucesso!!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
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
                                            'Não foi possível deletar o Cliente no momento, tente novamente mais tarde!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        );
                                      }
                                    });
                                  },
                                ),
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => UpdateClient(
                                      client: client,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
