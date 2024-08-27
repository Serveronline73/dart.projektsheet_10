import 'dart:io';

void main() {
  int mobileNumber = 0;
  int code = 0;
  print("Eingabe Handy Rufnummer:");
  mobileNumber = int.parse(stdin.readLineSync()!);
  print("Eingabe Pin Code:");
  code = int.parse(stdin.readLineSync()!);
  if (mobileNumber == 015734818527 && code == 1708) {
    print("Verification Erfolgreich");
  } else {
    print(
        "Falsche Rufnummer oder Pin, Bitte Rufnummer und Pin erneut Eingeben");
  }
}
