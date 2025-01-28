

class ResultHelper {
  final String? result;
  final String? errorMessage;


  ResultHelper({this.result, this.errorMessage});

  @override
  String toStringvalue() {
    return 'Result(otpresult: $result, errorMessage: $errorMessage)';
  }
}



enum ResultStatus { success, error }

class ResultWithStatus<T> {
  final ResultStatus status;
  final T? data;
  final String? error;

  ResultWithStatus.success(this.data)
      : status = ResultStatus.success,
        error = null;

  ResultWithStatus.error(this.error)
      : status = ResultStatus.error,
        data = null;

  @override
  String toString() {
    return 'ResultWithStatus(status: $status, data: $data, error: $error)';
  }
}