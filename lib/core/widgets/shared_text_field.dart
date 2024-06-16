import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SharedTextField extends StatefulWidget {
  SharedTextField(
      {super.key,
      required this.labelText,
      required this.formControlName,
      required this.icon,
      this.obscureText,
      this.validationMessages,
      this.maxLine});
  final String labelText;
  final String formControlName;
  final IconData icon;
  final int? maxLine;
  final Map<String, String Function(Object)>? validationMessages;
  bool? obscureText;

  @override
  State<SharedTextField> createState() => _SharedTextFieldState();
}

class _SharedTextFieldState extends State<SharedTextField> {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
        formControlName: widget.formControlName,
        obscureText: widget.obscureText ?? false,
        validationMessages: widget.validationMessages,
        minLines: widget.maxLine ?? 1,
        maxLines: widget.maxLine ?? 1,
        decoration: InputDecoration(
          counterText: "",
          prefixIcon: Icon(widget.icon),
          suffixIcon: (widget.obscureText != null)
              ? IconButton(
                  onPressed: _onTapEye,
                  icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder: (child, animation) => FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              child: child,
                            ),
                          ),
                      child: Icon(
                          (widget.obscureText ?? false)
                              ? Icons.visibility_off
                              : Icons.visibility,
                          key: Key(
                            widget.obscureText.toString(),
                          ))))
              : const SizedBox(),
          hintText: widget.labelText,
        ));
  }

  void _onTapEye() => setState(() => widget.obscureText = !widget.obscureText!);

  @override
  void dispose() {
    super.dispose();
  }
}
