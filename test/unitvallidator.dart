

import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class ValidatorClass {
  String? email;
  String? password;
  String? showMessage;


  ValidatorClass(this.email, this.password, this.showMessage);

  bool validator() {
    if (email == null || email!.isEmpty) {
      showMessage = "Email must not be empty";
      return false;
    }
    if (password == null || password!.isEmpty) {
      showMessage = "Password must not be empty";
      return false;
    }
    if (password!.length < 4) {
      showMessage = "Password must be a valid password";
      return false;
    }
    return true;
  }
}


class MockShowMessage extends Mock {
  void call(String message);
}
void main() {
  late MockShowMessage mockShowMessage;

  setUp(() {
    mockShowMessage = MockShowMessage();
  });

  group('validator', () {
    test('returns false when email is empty', () {
      var validatorClass = ValidatorClass('', 'password', mockShowMessage as String?);

      expect(validatorClass.validator(), isFalse);
      verify(mockShowMessage("Email must not be empty")).called(1);
    });

    test('returns false when password is empty', () {
      var validatorClass = ValidatorClass('email@example.com', '', mockShowMessage as String?);

      expect(validatorClass.validator(), isFalse);
      verify(mockShowMessage("Password must not be empty")).called(1);
    });

    test('returns false when password is less than 4 characters', () {
      var validatorClass = ValidatorClass('email@example.com', '123', mockShowMessage as String?);

      expect(validatorClass.validator(), isFalse);
      verify(mockShowMessage("Password must be a valid password")).called(1);
    });

    test('returns true when email and password are valid', () {
      var validatorClass = ValidatorClass('email@example.com', 'password', mockShowMessage as String?);

      expect(validatorClass.validator(), isTrue);
    });
  });
}

