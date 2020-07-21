class Day {
  bool isOpen;
  int start;
  int end;

  Day({this.isOpen, this.start, this.end});

  Day.fromJson(Map<String, dynamic> json) {
    isOpen = json['isOpen'] as bool;
    start = json['start'] as int;
    end = json['end'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isOpen'] = isOpen;
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}