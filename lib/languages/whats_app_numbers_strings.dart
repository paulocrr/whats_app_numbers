class WhatsAppNumbersStrings {
  static final myApp = _MyApp();
  static final mainScreen = _MainScreen();
  static final addNumberScreen = _AddNumberScreen();
  static final textFieldErrors = _TextFieldErrors();
}

class _MyApp {
  final appTitle = 'Numeros de WhatsApp';
}

class _MainScreen {
  final appBarTitle = 'Numeros de WhatsApp';
  final openNumberTabTitle = 'Abrir numero en WhatsApp';
  final listNumberTabTitle = 'Lista de numeros';
}

class _AddNumberScreen {
  final numberLabel = 'Ingrese numero de telefono';
  final descriptionLabel = 'Descripcion';
  final addButtonText = 'Abrir en WA';
}

class _TextFieldErrors {
  final isRequiredError = 'Este campo es requerido';
  final isValidPhoneNumberError = 'Este no es un numero de telefono';
}
