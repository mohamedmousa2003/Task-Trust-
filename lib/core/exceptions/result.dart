sealed class Result<T> {}


class Success<T>extends Result<T>{
  final T data ;

  Success(this.data);
}

class Failure extends Result{
  final String messageError;

  Failure(this.messageError);

}