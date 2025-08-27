import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// MODELOS
class Pedido {
  final int id;
  final List<Produto> produtos;
  Pedido({required this.id, required this.produtos});
}

class Produto {
  final String nome;
  final String foto;
  Produto({required this.nome, required this.foto});
}

// WIDGET DE PRODUTOS (mini cards dentro do pedido)
class ProdutoCardMini extends StatelessWidget {
  final Produto produto;
  const ProdutoCardMini({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        leading: Image.asset(produto.foto, width: 50, fit: BoxFit.cover),
        title: Text(
          produto.nome,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// TELA COZINHEIRO
class Cozinha extends StatefulWidget {
  final List<Pedido> pedidos;
  const Cozinha({super.key, required this.pedidos});

  @override
  State<Cozinha> createState() => _CozinhaState();
}

class _CozinhaState extends State<Cozinha> {
  // Função de alert para confirmar
  void _mostrarConfirmacao(BuildContext context, Pedido pedido) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        title: const Text(
          "Confirmar Pedido",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "Deseja confirmar o pedido #${pedido.id}?",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // cancela
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Aqui tu chama a função que confirma no banco de dados
              // ex: Banco.confirmarPedido(pedido.id);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text(
              "Confirmar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Cozinha",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView.builder(
        itemCount: widget.pedidos.length,
        itemBuilder: (context, index) {
          final pedido = widget.pedidos[index];
          return Card(
            color: Colors.black87,
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pedido #${pedido.id}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: pedido.produtos
                        .map((produto) => ProdutoCardMini(produto: produto))
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () => _mostrarConfirmacao(context, pedido),
                      icon: const Icon(Icons.check, color: Colors.white),
                      label: const Text(
                        "Confirmar Pedido",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
