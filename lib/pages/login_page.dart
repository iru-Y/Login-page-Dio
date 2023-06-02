import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page_dio/main_page.dart';

class LoginPage extends StatefulWidget {


  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: "");
  var passwordController = TextEditingController(text: "");
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
                    child: SvgPicture.asset("assets/images/dio_logo.svg")),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text("Faça seu login e make the change._",
              style: TextStyle(
                fontSize: 18
              ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.050),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: emailController,
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.030),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: passwordController,
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
                onPressed: ()=> {
                      if(emailController.text.trim() == "" &&
                          passwordController.text.trim() == ""){
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (context)=> const MainPage()
                          ))
                      }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login ou senha incorreto")))}},
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
