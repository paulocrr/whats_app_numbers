import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';
import 'package:whats_app_numbers/extensions/phone_number_extension.dart';
import 'package:whats_app_numbers/languages/whats_app_numbers_strings.dart';
import 'package:whats_app_numbers/models/phone_number.dart';
import 'package:whats_app_numbers/widgets/whats_app_number_text_form_field.dart';

class AddNumberScreen extends StatefulWidget {
  final void Function(PhoneNumber)? onSave;

  const AddNumberScreen({super.key, this.onSave});

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
                    r'\(\+51\)\s9((\d{8})|(\d{2}\s\d{3}\s\d{3}))',
                    errorText: WhatsAppNumbersStrings
                        .textFieldErrors.isValidPhoneNumberError,
                  )
                ]),
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: "(+51) ### ### ###",
                    filter: {"#": RegExp(r'[0-9]')},
                  )
                ],
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
                    final phoneNumber = PhoneNumber(
                      id: const Uuid().v1(),
                      number: _numberController.text,
                      description: _descriptionController.text,
                    );

                    final onSave = widget.onSave;

                    if (onSave != null) {
                      onSave(phoneNumber);
                    }

                    _numberController.clear();
                    _descriptionController.clear();

                    phoneNumber.openWhatsAppWebPage();
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
