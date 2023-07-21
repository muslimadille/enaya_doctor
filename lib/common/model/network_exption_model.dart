class NetworkExceptionModel {
  final bool dismissProgress;
  final bool showError;

  const NetworkExceptionModel(
      {
        this.dismissProgress=true,
        this.showError=true
      });
}