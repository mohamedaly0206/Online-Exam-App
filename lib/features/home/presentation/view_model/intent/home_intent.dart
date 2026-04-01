sealed class HomeIntents {}

class GetAllSubjectsIntent extends HomeIntents {}

class ChangeTapIntent extends HomeIntents {
  final int index;

  ChangeTapIntent(this.index);
}

class SearchSubjectsIntent extends HomeIntents {
  final String query;

  SearchSubjectsIntent(this.query);
}
