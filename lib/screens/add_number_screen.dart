import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:whats_app_numbers/languages/whats_app_numbers_strings.dart';
import 'package:whats_app_numbers/widgets/whats_app_number_text_form_field.dart';

class AddNumberScreen extends StatefulWidget {
  const AddNumberScreen({super.key});

  @override
  State<AddNumberScreen> createState() => _AddNumberScreenState();
}

class _AddNumberScreenState extends State<AddNumberScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              WhatsAppNumberTextFormField(
                keyboardType: TextInputType.phone,
                controller: _numberController,
                labelText: WhatsAppNumbersStrings.addNumberScreen.numberLabel,
                validator: MultiValidator([
                  RequiredValidator(
                    errorText:
                        WhatsAppNumbersStrings.textFieldErrors.isRequiredError,
                  ),
                  PatternValidator(
                    r'9((\d{8})|(\d{2}\s\d{3}\s\d{3}))',
                    errorText: WhatsAppNumbersStrings
                        .textFieldErrors.isValidPhoneNumberError,
                  )
                ]),
              ),
              WhatsAppNumberTextFormField(
                controller: _descriptionController,
                labelText:
                    WhatsAppNumbersStrings.addNumberScreen.descriptionLabel,
                maxLength: 20,
                validator: RequiredValidator(
                  errorText:
                      WhatsAppNumbersStrings.textFieldErrors.isRequiredError,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(_descriptionController.text);
                  }
                },
                icon: const Icon(Icons.person_add_alt),
                label:
                    Text(WhatsAppNumbersStrings.addNumberScreen.addButtonText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
