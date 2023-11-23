class InfoModel {
  final int? id;
  final String info;

  InfoModel({ this.id, required this.info});

  InfoModel copyWith({
    int? id,
    String? info,
  }) {
    return InfoModel(
      id: id ?? this.id,
      info: info ?? this.info,
    );
  }

  @override
  String toString() => 'InfoModel(id: $id, info: $info)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InfoModel &&
      other.id == id &&
      other.info == info;
  }

  @override
  int get hashCode => id.hashCode ^ info.hashCode;
}
