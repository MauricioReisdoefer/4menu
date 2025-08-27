import 'package:flutter/material.dart';
import 'package:newproject/components/footer.dart';

class Resgister extends StatefulWidget {
  const Resgister({super.key});

  @override
  State<Resgister> createState() => _ResgisterState();
}

class _ResgisterState extends State<Resgister> {
  bool _senhaVisivel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Image.asset(
            'assets/images/4menu.png',
            height: 120,
            width: 120,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nome
              const Text("Nome", style: TextStyle(color: Colors.white70)),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Digite seu nome",
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Senha
              const Text("Senha", style: TextStyle(color: Colors.white70)),
              TextField(
                obscureText: !_senhaVisivel,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white54,
                    ),
                    onPressed: () {
                      setState(() {
                        _senhaVisivel = !_senhaVisivel;
                      });
                    },
                  ),
                  hintText: "Digite sua senha",
                  hintStyle: const TextStyle(color: Colors.white54),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white30),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Botão cadastrar
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Entrar", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const RodapeRestaurante(abaAtual: 'registrar'),
    );
  }
}
