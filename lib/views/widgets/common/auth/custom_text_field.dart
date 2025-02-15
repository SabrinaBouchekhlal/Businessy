import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';


class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final List<String> countryCodeOptions;
  final String initialCountryCode;
  final String? Function(String?)? validator; // Added validator

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.readOnly = false,
    this.keyboardType,
    this.onTap,
    this.countryCodeOptions = const ['+213', '+1', '+44'],
    this.initialCountryCode = '+213',
    this.validator, // Accepting the validator
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late String _selectedCountryCode;
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedCountryCode = widget.initialCountryCode;

    // Listen for changes in the focus state
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      onTap: widget.onTap,
      validator: widget.validator,
      style: const TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 16.0,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          fontFamily: 'Urbanist',
          color: _focusNode.hasFocus ? blackColor : inputPlaceholder,
          fontSize: 14.0,
        ),
        filled: true,
        fillColor: _focusNode.hasFocus ? Colors.white : inputBg,
        errorStyle: LoginTypography.error,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: inputBorder, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: inputBorder, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: brighterGreen, width: 2.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: brighterGreen, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.keyboardType == TextInputType.phone
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: DropdownButton<String>(
            value: _selectedCountryCode,
            underline: const SizedBox.shrink(),
            items: widget.countryCodeOptions
                .map((code) => DropdownMenuItem<String>(
              value: code,
              child: Text(code),
            ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedCountryCode = value;
                });
              }
            },
            style: const TextStyle(color: Colors.black),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          ),
        )
            : null,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      ),
    );
  }
}


