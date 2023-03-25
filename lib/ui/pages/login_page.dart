import 'package:curso_arquitetura/ui/pages/pages.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;
  const LoginPage({super.key, required this.presenter});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginHeader(),
            Text(
              'Login'.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
              ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Form(child: 
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                      icon:  Icon(Icons.email)
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                    TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Senha"),
                      icon:  Icon(Icons.lock)
                    ),
                    obscureText: true,
                  ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () { },
                          child: Text('Entrar'.toUpperCase()),
                        ),
                
                          TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () { },
                          child: Text('Criar conta'.toUpperCase()),
                        ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerRight,end: Alignment.bottomLeft,colors: [ Theme.of(context).primaryColorLight,Theme.of(context).primaryColorDark  ] ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 0,
            blurRadius: 4,
            color: Colors.black
          )
        ],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))
      ),
      child: const Image(image: AssetImage('lib/ui/assets/logo.png')),
    );
  }
}