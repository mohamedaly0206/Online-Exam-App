sealed class ExamsIntent {}

class GetExamsIntent extends ExamsIntent {
  final String subjectId;
  GetExamsIntent({required this.subjectId});
}
