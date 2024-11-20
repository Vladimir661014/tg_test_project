class SelectedScreenModel {
  SelectedScreenModel({
    this.selectedIndex = 0,
  });

  final int selectedIndex;

  SelectedScreenModel copyWith({
    final int? selectedIndex,
  }) {
    return SelectedScreenModel(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
