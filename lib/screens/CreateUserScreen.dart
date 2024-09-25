import 'package:flutter/material.dart';
import 'package:post_paulo/models/User.dart';
import 'package:post_paulo/widgets/TextFieldWidget.dart';

class CreateUserScreen extends StatefulWidget {
  final Function(User)? onUserCreated;

  const CreateUserScreen({this.onUserCreated, super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _apellido = '';
  String _correo = '';
  String _password = '';

  void _saveUser() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final user = User(
          nombre: _nombre,
          apellido: _apellido,
          correo: _correo,
          password: _password);
      if (widget.onUserCreated != null) {
        widget.onUserCreated!(user);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
    );

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'Crear usuario',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 165,
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Textfieldwidget(
                label: 'Nombre',
                placeholder: 'Nombre',
                icon: Icons.person,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                style: textStyle,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ej. Juan',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un nombre';
                  }
                  return null;
                },
                onSaved: (value) => _nombre = value!.trim(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: textStyle,
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Ej. Perez',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu apellido';
                  }
                  return null;
                },
                onSaved: (value) => _apellido = value!.trim(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: textStyle,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  hintText: 'Ej. juan@example.com',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Por favor, ingresa un correo válido';
                  }
                  return null;
                },
                onSaved: (value) => _correo = value!.trim(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: textStyle,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Mínimo 8 caracteres',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingresa una contraseña válida';
                  } else if (value.trim().length < 8) {
                    return 'La contraseña debe tener al menos 8 caracteres';
                  }
                  return null;
                },
                onChanged: (value) => _password = value.trim(),
                onSaved: (value) => _password = value!.trim(),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: textStyle,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                  hintText: 'Mínimo 8 caracteres',
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingresa una contraseña válida';
                  } else if (value.trim() != _password) {
                    return 'Las contraseñas deben coincidir';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  backgroundColor: Colors.blueGrey[800],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _saveUser,
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
