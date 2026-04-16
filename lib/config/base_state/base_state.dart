class BaseState<T> {
  bool isLoading = false;
  String? errorMessage;
  T? data;

  BaseState({this.isLoading = false, this.data, this.errorMessage});

  BaseState<T> copyWith({
    bool? isLoadingParam,
    T? dataParam,
    String? errorMessageParam,
  }) {
    return BaseState<T>(
      isLoading: isLoadingParam ?? isLoading,
      data: dataParam ?? data,
      errorMessage: errorMessageParam ?? errorMessage,
    );
  }
}
