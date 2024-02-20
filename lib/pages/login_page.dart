import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api/controller/auth_controller.dart';
import 'package:flutter_app/components/alert_widget.dart';
import 'package:flutter_app/pages/client_list.dart';
import 'package:line_icons/line_icon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // LOGIN
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  // REGISTER
  final TextEditingController newUserlController = TextEditingController();
  final TextEditingController newUserEmailController = TextEditingController();
  final TextEditingController newUserPasswordController =
      TextEditingController();

  bool isSignIn = false;
  bool isShowPass = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // CREATE USER //

  Future<void> createUser(BuildContext context, VoidCallback onSucess) async {
    String name = newUserlController.text;
    String email = newUserEmailController.text;
    String password = newUserPasswordController.text;

    // Chamada da API para criar usuário
    await AuthController.createUser(
      name,
      email,
      password,
    );
    onSucess.call();
  }

  // MAKE LOGIN //

  Future<void> userLogin(BuildContext context, VoidCallback onSucess) async {
    String email = loginEmailController.text;
    String password = loginPasswordController.text;

    // Chamada da API para fazer login!
    await AuthController.fazerLogin(
      email,
      password,
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                if (!isSignIn)
                  const SizedBox(
                    height: 30,
                  ),
                if (!isSignIn)
                  BounceInDown(
                    from: 250,
                    child: const Center(
                      child: Text(
                        'Faça seu login',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 40,
                ),
                if (!isSignIn)
                  FadeInDown(
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
                                controller: loginEmailController,
                                decoration: const InputDecoration(
                                  icon: LineIcon.user(),
                                  hintText: 'Digite seu e-mail',
                                  border: InputBorder.none,
                                ),
                                validator: (String? value) {
                                  return (value != null && value.isEmpty)
                                      ? 'Digite algum email.'
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
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      obscureText: !isShowPass,
                                      controller: loginPasswordController,
                                      decoration: const InputDecoration(
                                        icon: LineIcon.lock(),
                                        hintText: 'Digite sua senha',
                                        border: InputBorder.none,
                                      ),
                                      validator: (String? value) {
                                        return (value != null && value.isEmpty)
                                            ? 'Digite uma senha.'
                                            : null;
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      isShowPass = !isShowPass;
                                    }),
                                    child: isShowPass
                                        ? const LineIcon.eye()
                                        : const LineIcon.eyeSlash(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                // ***** SE FOR PARA CADASTRO******
                if (isSignIn)
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
                                controller: newUserlController,
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
                                controller: newUserEmailController,
                                decoration: const InputDecoration(
                                  icon: LineIcon.mailBulk(),
                                  hintText: 'Digite seu e-mail',
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
                                      offset: Offset(
                                          0, 11) // changes position of shadow
                                      ),
                                ]),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller: newUserPasswordController,
                                      obscureText: !isShowPass,
                                      decoration: const InputDecoration(
                                        icon: LineIcon.lock(),
                                        hintText: 'Digite sua senha',
                                        border: InputBorder.none,
                                      ),
                                      validator: (String? value) {
                                        return (value != null && value.isEmpty)
                                            ? 'Digite uma senha.'
                                            : null;
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      isShowPass = !isShowPass;
                                    }),
                                    child: isShowPass
                                        ? const LineIcon.eye()
                                        : const LineIcon.eyeSlash(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      isSignIn
                          ? createUser(context, () {
                              if (mounted) {
                                customAlert(
                                  context,
                                  content: const Text(
                                    'Sucesso, faça seu login!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Center(
                                      child: TextButton(
                                        style: const ButtonStyle(
                                          alignment: Alignment.center,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isSignIn = !isSignIn;
                                          });
                                          Navigator.of(context).pop();
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
                                    'Não foi possível criar um novo Usuário no momento, tente novamente mais tarde!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }
                            })
                          : userLogin(context, () {
                              if (mounted) {
                                customAlert(
                                  context,
                                  content: const Text(
                                    'Sucesso, bem vindo!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
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
                                    'Não foi possível criar um novo Usuário no momento, tente novamente mais tarde!',
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
                    child: Center(
                      child: Text(
                        !isSignIn ? "Entrar" : "Cadastrar",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      !isSignIn ? 'Não tem conta ?' : '',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignIn = !isSignIn;
                        });
                      },
                      child: Text(
                        !isSignIn ? 'Cadastre-se!!' : 'Fazer login',
                        style: const TextStyle(
                          color: Color(0XFF2945FF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
