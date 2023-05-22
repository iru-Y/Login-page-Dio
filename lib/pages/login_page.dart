import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {


  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.050),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 7,
                    child: Image.asset("assets/images/dio_logo.png"
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Text(
                "já tem cadastro?",
                style: TextStyle(
                  fontSize: 35
                ),
              ),
              const SizedBox(height: 20),
              const Text("Faça seu login e make the change._",
              style: TextStyle(
                fontSize: 18
              ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (_)=> email = _,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.020),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary
                          )
                      ),
                    prefixIcon: const Icon(
                      Icons.mail_outlined,
                      color: Color(0xFF932ED1),
                    ),
                    hintText: "E-mail",
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  onChanged: (_)=> password = _,
                  obscureText: isObscureText,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.020),
                      enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary
                      )
                    ),
                    prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF932ED1)),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                            isObscureText ?
                            Icons.visibility_off : Icons.visibility,
                            color: Colors.white
                        ),
                      ),
                      hintText: "Digite sua senha",
                      hintStyle: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      )
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  )
                ),
                onPressed: ()=> print("${email!} ${password!}"),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text("ENTRAR"),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              TextButton(
                  onPressed: ()=> {},
                  child: const Text("Esqueci minha senha",
                    style: TextStyle(color: Colors.amberAccent),
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.002),
              TextButton(
                  onPressed: ()=> {},
                  child: const Text("Criar conta",
                    style: TextStyle(
                        color: Colors.lightGreen
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
