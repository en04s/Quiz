import 'package:flutter/material.dart';
import 'tela_quiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ínicio'),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/re4wallpaper.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black54, 
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0, 
                    ),
                    borderRadius: BorderRadius.circular(8.0), 
                  ),
                  child: Text(
                    'Bem-vindo(a) à Valdelobos!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, 
                    ),
                    textAlign: TextAlign.center, 
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: 150, 
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.black54, 
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0, 
                    ),
                    borderRadius: BorderRadius.circular(8.0), 
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(vertical: 10.0), 
                    ),
                    child: Text(
                      'Começar',
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
    );
  }
}
