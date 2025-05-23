import 'package:flutter/material.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  State<ContactFormWidget> createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final heigth = size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width > 600 ? 600 : width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("Contact Form",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                    label: 'Name',
                    controller: _nameController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter your name'
                        : null,
                  ),
                  _buildTextField(
                    label: 'Email',
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Enter your email';
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value))
                        return 'Enter a valid email';
                      return null;
                    },
                  ),
                  _buildTextField(
                    label: 'Phone Number',
                    controller: _phoneController,
                    inputType: TextInputType.phone,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter your phone number'
                        : null,
                  ),
                  _buildTextField(
                    label: 'Subject',
                    controller: _subjectController,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter subject' : null,
                  ),
                  _buildTextField(
                    label: 'Message',
                    controller: _messageController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter your message'
                        : null,
                    maxLines: 4,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(width, 40),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
