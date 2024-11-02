enum TableEnum implements Comparable<TableEnum> {
  user(name: 'users');

  const TableEnum({
    required this.name,
  });

  final String name;

  @override
  int compareTo(TableEnum other) {
    return name.compareTo(other.name);
  }
}
