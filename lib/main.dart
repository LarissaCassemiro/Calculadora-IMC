import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controllerAltura = TextEditingController();
  TextEditingController _controllerPeso = TextEditingController();
  String _resultado = '';
  void _calcular() {
    double altura = double.parse(_controllerAltura.text) / 100.0;
    double peso = double.parse(_controllerPeso.text);
    double calculoIMC = peso / (altura * altura);
    if (altura == null || peso == null) {
      _resultado = 'Digite algo para ser calculado';
    }
    if (altura != null && peso != null) {
      calculoIMC = peso / (altura * altura);
      if (calculoIMC <= 18.5) {
        _resultado =
            'Você está abaixo do peso, meu consagrado(a), seu IMC é ${calculoIMC.toStringAsPrecision(4)}';
      } else if (calculoIMC >= 18.6 && calculoIMC <= 24.9) {
        _resultado =
            'Você está no peso ideal, meu caro(a), seu IMC é ${calculoIMC.toStringAsPrecision(4)}';
      } else if (calculoIMC >= 25.0 && calculoIMC <= 29.9) {
        _resultado =
            'Você está com sobrepeso, meu mano(a), seu IMC é ${calculoIMC.toStringAsPrecision(4)}';
      } else if (calculoIMC >= 30.0 && calculoIMC <= 34.9) {
        _resultado =
            'Você está com obesidade de grau I, meu rei, seu IMC é ${calculoIMC.toStringAsPrecision(4)}';
      } else if (calculoIMC >= 35.0 && calculoIMC <= 39.9) {
        _resultado =
            'Você está com obesidade de grau II, meu patriarca, seu IMC é ${calculoIMC.toStringAsPrecision(4)}';
      } else if (calculoIMC >= 40.0) {
        _resultado =
            'Você está com obesidade de grau III, meu senhor(a), seu IMC é ${calculoIMC.toStringAsPrecision(4)}';
      }
    }
    setState(() {
      _resultado;
    });
  }

  // 1 - IMPLEMENTE O CÓDIGO PARA RECEBER OS VALORES DIGITADOS NO FORMULÁRIO

  // 2 - CRIE A VARIÁVEL RESPONSÁVEL POR EXIBIR O RESULTADO FINAL

  // 3 - IMPLEMENTE O MÉTODO QUE FARA A LÓGICA DO APLICATIVO, E A FUNÇÃO PARA RECONSTRUIR A TELA DO APLICATIVO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: const Color.fromARGB(255, 59, 178, 38),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    'https://lh3.googleusercontent.com/y5G9NIkLEBWfo-AYA00eH7DPtJGcvKqhi36pjpik0Y1oRYiwXXLyUHvvoMidPNL7JRU0',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Peso em Kg',
                      hintText: 'Digite o seu peso em kg',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                    ),
                    controller: _controllerPeso,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Altura em m',
                      hintText: 'Digite a sua altura em m',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                    ),
                    controller: _controllerAltura,
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    height: 30,
                    width: 800,
                    child: ElevatedButton(
                      child: const Text(
                        'CALCULAR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(247, 46, 46, 1),
                          fontSize: 25,
                        ),
                      ),
                      onPressed: _calcular,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
