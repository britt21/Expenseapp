

class ResultHelper {
  final String? result;
  final String? errorMessage;


  ResultHelper({this.result, this.errorMessage});

  @override
  String toStringvalue() {
    return 'Result(otpresult: $result, errorMessage: $errorMessage)';
  }
}


