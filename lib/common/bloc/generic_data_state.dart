abstract class GenericDataState {}

class DataLoading extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {
  final T data;

  DataLoaded({required this.data});
}

class FailureLoadedData extends GenericDataState {
  final String errorMessage;

  FailureLoadedData({required this.errorMessage});
}
