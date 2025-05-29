import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String id;
  final String name;
  final String description;
  final String price;
  final String stock;
  final String category;
  final String dateAdded;

  const Details({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.dateAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color blueSoft = Colors.lightBlue.shade200;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blueSoft,
        title: const Text("Detalles del Producto"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          buildTile("ID Producto", id, Icons.confirmation_number),
          buildTile("Nombre", name, Icons.text_fields),
          buildTile("Descripción", description, Icons.description),
          buildTile("Precio", price, Icons.attach_money),
          buildTile("Cant. Disponible", stock, Icons.inventory),
          buildTile("Categoría", category, Icons.category),
          buildTile("Fecha Añadido", dateAdded, Icons.date_range),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: blueSoft,
                minimumSize: const Size(double.infinity, 50),
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                "Agregar Otro Producto",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context); // Vuelve al formulario limpio
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildTile(String title, String subtitle, IconData icon) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.0, color: Colors.grey.shade300),
      ),
      leading: Icon(icon, color: Colors.lightBlue.shade200),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }
}
