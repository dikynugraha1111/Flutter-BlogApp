import 'package:flutter/material.dart';

// widget buatan dibuat sebagai class
class SearchTextInput extends StatelessWidget {
  // parameter buatan sendiri agar lebih custom
  const SearchTextInput({
    Key? key,
    required this.controller,
    required this.label, // tulisan diatas input
    this.labelText, // teks placeholder
    this.initialValue, // value awal dalam inputan
    required this.valueSetter, // fungsi pengubah value dengan isian inputan
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String? labelText;
  final String? initialValue;
  final Function(String?) valueSetter;

  @override
  Widget build(BuildContext context) {
    InputBorder _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(
        color: Color(0xFF5B5770),
        width: 1.0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: _inputBorder,
            errorBorder: _inputBorder,
            focusedErrorBorder: _inputBorder,
            focusedBorder: _inputBorder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: labelText ?? "Masukkan $label...",
            contentPadding: const EdgeInsets.all(18.0),
            suffixIcon: IconButton(
              onPressed: () {
                valueSetter(controller.text);
              },
              icon: const Icon(Icons.search),
            ),
          ),
          onFieldSubmitted: (val) {
            valueSetter(val);
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
