class RecitersResponseModel {

  final List<RecitersItemEntity>? reciters;

  RecitersResponseModel({
    this.reciters,
  });

  factory RecitersResponseModel.fromJson(Map<String, dynamic> json) {
    return RecitersResponseModel(
      reciters: json['reciters'] == null ? null : List<RecitersItemEntity>.from(
          json['reciters'].map((x) => RecitersItemEntity.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'reciters': reciters?.map((e) => e.toJson()).toList(),
      };
}

class RecitersItemEntity {

  final String? date;
  final String? letter;
  final String? name;
  final num? id;
  final List<MoshafItemEntity>? moshaf;

  RecitersItemEntity({
    this.date,
    this.letter,
    this.name,
    this.id,
    this.moshaf,
  });

  factory RecitersItemEntity.fromJson(Map<String, dynamic> json) {
    return RecitersItemEntity(
      date: json['date'],
      letter: json['letter'],
      name: json['name'],
      id: json['id'],
      moshaf: json['moshaf'] == null ? null : List<MoshafItemEntity>.from(
          json['moshaf'].map((x) => MoshafItemEntity.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'date': date,
        'letter': letter,
        'name': name,
        'id': id,
        'moshaf': moshaf?.map((e) => e.toJson()).toList(),
      };
}

class MoshafItemEntity {

  final String? server;
  final num? moshafType;
  final String? name;
  final String? surahList;
  final num? id;
  final num? surahTotal;

  MoshafItemEntity({
    this.server,
    this.moshafType,
    this.name,
    this.surahList,
    this.id,
    this.surahTotal,
  });

  factory MoshafItemEntity.fromJson(Map<String, dynamic> json) {
    return MoshafItemEntity(
      server: json['server'],
      moshafType: json['moshaf_type'],
      name: json['name'],
      surahList: json['surah_list'],
      id: json['id'],
      surahTotal: json['surah_total'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'server': server,
        'moshaf_type': moshafType,
        'name': name,
        'surah_list': surahList,
        'id': id,
        'surah_total': surahTotal,
      };
}