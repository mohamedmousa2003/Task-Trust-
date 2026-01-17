abstract class AppFailures {
  final String message;

  const AppFailures(this.message);

  @override
  String toString() => message;
}

class RemoteFailures extends AppFailures {
  const RemoteFailures(super.message);
}

class LocalFailures extends AppFailures {
  const LocalFailures(super.message);
}
