import 'package:flutter/material.dart';
import '../model/cep.dart';
import '../services/cep_service.dart';
import '../widgets/botoes.dart';
import '../widgets/input_textos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _textoBotao = "Pesquisar o CEP";
  Cep? _cep;
  final CepService _service = CepService();
  final TextEditingController _controllerCep = TextEditingController();

  Future<void> _buscaCep() async {
    setState(() {
      _textoBotao = "Buscando cep...";
    });

    try {
      final resultado = await _service.buscarCep(_controllerCep.text);
      setState(() {
        _cep = resultado;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro: $e")),
        );
      }
    } finally {
      setState(() {
        _textoBotao = "Pesquisar o CEP";
      });
    }
  }

  Widget _body() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        InputTextos("Informe o CEP", "", controller: _controllerCep),
        Botoes(_textoBotao, onPressed: _buscaCep),
        const SizedBox(height: 16),
        Text("A cidade é: ${_cep?.localidade ?? 'null'}",
            style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text(
          "O logradouro é: ${_cep?.logradouro?.isNotEmpty ?? false ? _cep!.logradouro : ''}",
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Text("O bairro é: ${_cep?.bairro ?? 'null'}",
            style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text("O estado é: ${_cep?.uf ?? 'null'}",
            style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consulta CEP"),
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }
}