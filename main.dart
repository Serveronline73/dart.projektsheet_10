import 'dart:io';
import 'dart:math';

// Registration & Verification
void main() {
  String? mobileNumber;
  String? userName;
  String verificationCode;
  Map<String, List<String>> contacts = {};
  List<String> messages = [];

  // Eingabe der Benutzername
  stdout.write("Geben Sie bitte ihren Benutzernamen ein: ");
  userName = stdin.readLineSync();

  // Eingabe Mobilnummer
  stdout.write("Geben Sie bitte ihre Mobilnummer ein: ");
  mobileNumber = stdin.readLineSync();

  // Generierung des Verifizierungscodes
  Random random = Random();
  verificationCode = (random.nextInt(9000) + 1000).toString();
  print("Ihr Verifizierungscode ist: $verificationCode");

  // Eingabe des Verifizierungscodes
  stdout.write("Geben Sie bitte ihren Verifizierungscode ein: ");
  String? inputVerificationCode = stdin.readLineSync();

  if (mobileNumber != null &&
      mobileNumber.isNotEmpty &&
      userName != null &&
      userName.isNotEmpty &&
      inputVerificationCode == verificationCode) {
    print("Registrierung und Verification erfolgreich!");
    print("");
    print("Willkommen bei GlobeTransMessage, $userName.");

    // Direkt zum Menü weiterleiten
    while (true) {
      stdout.write(
          "Wählen Sie eine Option:\n1. Kontakt anlegen\n2. Nachricht senden\n3. Nachricht lesen\n4. Abmelden\n");
      String? option = stdin.readLineSync();

      switch (option) {
        case "1":
          // Kontakt anlegen
          stdout.write("Geben Sie bitte den Namen des Kontakts ein: ");
          String? contactName = stdin.readLineSync();
          stdout.write("Geben Sie bitte die Telefonnummer des Kontakts ein: ");
          String? contactNumber = stdin.readLineSync();

          if (contactName != null && contactNumber != null) {
            contacts[contactName] = [contactNumber];
            print("Kontakt $contactName erfolgreich angelegt.");
          } else {
            print(
                "Fehler beim Anlegen des Kontakts. Bitte versuchen Sie es erneut.");
          }
          break;

        case "2":
          // Nachricht senden
          if (contacts.isEmpty) {
            print("Bitte legen Sie zuerst einen Kontakt an.");
          } else {
            stdout.write("Geben Sie bitte den Empfängernamen ein: ");
            String? recipientUsername = stdin.readLineSync();
            stdout.write("Geben Sie bitte die Nachricht ein: ");
            String? message = stdin.readLineSync();

            if (recipientUsername != null && message != null) {
              if (contacts.containsKey(recipientUsername)) {
                messages
                    .add("Nachricht an $recipientUsername gesendet: $message");
                print("Nachricht erfolgreich gesendet.");
              } else {
                print(
                    "Empfänger nicht gefunden. Bitte versuchen Sie es erneut.");
              }
            } else {
              print(
                  "Fehler beim Senden der Nachricht. Bitte versuchen Sie es erneut.");
            }
          }
          break;

        case "3":
          // Nachricht lesen
          if (messages.isNotEmpty) {
            for (String msg in messages) {
              print(msg);
            }
          } else {
            print("Keine Nachrichten vorhanden.");
          }
          break;

        case "4":
          // Abmelden
          print("Auf Wiedersehen, $userName!");
          return;

        default:
          print("Ungültige Option. Bitte versuchen Sie es erneut.");
      }
    }
  } else {
    print("Registrierung fehlgeschlagen. Bitte geben Sie gültige Daten ein.");
    return;
  }
}
