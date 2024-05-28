import 'package:flutter/material.dart';
import 'tela_destino.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;
  
  final List<Pergunta> _perguntas = [
    Pergunta(
      pergunta: 'Qual o nome do parasita que controla os ganados?',
      resposta: ['Las Plagas', 'Uroboros', 'T-Vírus', 'G-Vírus'],
      respostacorreta: 'Las Plagas',
      imagemPath: 'assets/imagens/ganadoarma.gif',
    ),
    Pergunta(
      pergunta: 'O que acontece se você matar peixes na lagoa?',
      resposta: ['Você consegue alguns peixes', 'O Del Lago te come'],
      respostacorreta: 'O Del Lago te come',
      imagemPath: 'assets/imagens/dellago.gif',
    ),
    Pergunta(
      pergunta: 'Qual o nome da mulher que trabalha para o Wesker?',
      resposta: ['Ashley', 'Hunnigan', 'Shevan', 'Ada'],
      respostacorreta: 'Ada',
      imagemPath: 'assets/imagens/weskera.gif',
    ),
    Pergunta(
      pergunta: 'Qual o nome do culto?',
      resposta: ['Los Ganados', 'Los Illuminados', 'Plagas', 'Novo Mundo'],
      respostacorreta: 'Los Illuminados',
      imagemPath: 'assets/imagens/ilumi.gif',
    ),
  ];

  void _responderPerguntas(String resposta) {
    if (_perguntas[_perguntaAtual].respostacorreta == resposta) {
      setState(() {
        _pontuacao++;
      });
    }
    
    if (_perguntaAtual < _perguntas.length - 1) {
      setState(() {
        _perguntaAtual++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Telaresultado(_pontuacao, _perguntas.length)),
      );
    }
  }

  void resetQuiz() {
    setState(() {
      _perguntaAtual = 0;
      _pontuacao = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jogue!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagens/fundo.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      _perguntas[_perguntaAtual].imagemPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _perguntas[_perguntaAtual].pergunta,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _perguntas[_perguntaAtual].resposta.map((resposta) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => _responderPerguntas(resposta),
                        child: Text(
                          resposta,
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50), 
                          backgroundColor: Colors.blue[900], 
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Acertou $_pontuacao de ${_perguntas.length} perguntas!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white, 
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pergunta {
  final String pergunta;
  final List<String> resposta;
  final String respostacorreta;
  final String imagemPath;

  Pergunta({
    required this.pergunta,
    required this.resposta,
    required this.respostacorreta,
    required this.imagemPath,
  });
}
