import 'package:flutter/material.dart';
import 'details.dart';

final Color blueSoft = Colors.lightBlue.shade200;

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();

  DateTime? _selectedDate;

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    _categoryController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de Producto"),
        centerTitle: true,
        backgroundColor: blueSoft,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              fieldName: "ID Producto",
              myController: _idController,
              myIcon: Icons.confirmation_number,
              prefixIconColor: blueSoft,
            ),
            const SizedBox(height: 10),
            MyTextField(
              fieldName: "Nombre",
              myController: _nameController,
              myIcon: Icons.text_fields,
              prefixIconColor: blueSoft,
            ),
            const SizedBox(height: 10),
            MyTextField(
              fieldName: "Descripción",
              myController: _descriptionController,
              myIcon: Icons.description,
              prefixIconColor: blueSoft,
            ),
            const SizedBox(height: 10),
            MyTextField(
              fieldName: "Precio",
              myController: _priceController,
              myIcon: Icons.attach_money,
              prefixIconColor: blueSoft,
            ),
            const SizedBox(height: 10),
            MyTextField(
              fieldName: "Cant. Disponible",
              myController: _stockController,
              myIcon: Icons.inventory_2,
              prefixIconColor: blueSoft,
            ),
            const SizedBox(height: 10),
            MyTextField(
              fieldName: "Categoría",
              myController: _categoryController,
              myIcon: Icons.category,
              prefixIconColor: blueSoft,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                    _dateController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
              child: AbsorbPointer(
                child: MyTextField(
                  fieldName: "Fecha Añadido",
                  myController: _dateController,
                  myIcon: Icons.date_range,
                  prefixIconColor: blueSoft,
                ),
              ),
            ),
            const SizedBox(height: 20),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(200, 50),
        side: BorderSide(color: blueSoft),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Details(
                id: _idController.text,
                name: _nameController.text,
                description: _descriptionController.text,
                price: _priceController.text,
                stock: _stockController.text,
                category: _categoryController.text,
                dateAdded: _dateController.text,
              );
            },
          ),
        );
      },
      child: Text(
        "ENVIAR FORMULARIO",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: blueSoft,
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String fieldName;
  final TextEditingController myController;
  final IconData myIcon;
  final Color prefixIconColor;

  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.info_outline,
    this.prefixIconColor = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: prefixIconColor),
        ),
        labelStyle: TextStyle(color: prefixIconColor),
      ),
    );
  }
}
