class RadioResponseModel {

final List<RadiosItemEntity>? radios;

RadioResponseModel.dart
(
{this.radios,
});

factory RadioResponseModel.fromJson(Map<String, dynamic> json) {
return RadioResponseModel.dart(
radios: json['radios'] == null? null : List<RadiosItemEntity>.from(json['radios'].map((x) => RadiosItemEntity.fromJson(x))),
);
}

Map<String, dynamic> toJson() => {
'radios': radios?.map((e) => e.toJson()).toList(),
};
}

class RadiosItemEntity {

final String? name;
final String? recentDate;
final num? id;
final String? url;

RadiosItemEntity({
this.name,
this.recentDate,
this.id,
this.url,
});

factory RadiosItemEntity.fromJson(Map<String, dynamic> json) {
return RadiosItemEntity(
name: json['name'],
recentDate: json['recent_date'],
id: json['id'],
url: json['url'],
);
}

Map<String, dynamic> toJson() => {
'name': name,
'recent_date': recentDate,
'id': id,
'url': url,
};
}