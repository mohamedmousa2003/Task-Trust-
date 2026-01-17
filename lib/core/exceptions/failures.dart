// core/exceptions/failures.dart

abstract class AppFailures {
  final String message;
  const AppFailures(this.message);

  @override
  String toString() => message;
}

// Remote / API related
class RemoteFailures extends AppFailures {
  const RemoteFailures(super.message);
}

// Local / cache related
class LocalFailures extends AppFailures {
  const LocalFailures(super.message);
}

// Specific types
class NetworkFailure extends RemoteFailures {
  const NetworkFailure([super.message = "No internet connection"]);
}

class TimeoutFailure extends RemoteFailures {
  const TimeoutFailure([super.message = "Request timed out"]);
}

class UnknownFailure extends RemoteFailures {
  const UnknownFailure([super.message = "Something went wrong"]);
}
