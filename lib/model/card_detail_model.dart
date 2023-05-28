class CardDetailModel{
  int _id;
  String _title;
  String _pic;
  String _text;

  CardDetailModel(this._id, this._title, this._pic, this._text);

  String get text => _text;

  set text(String value) {
    _text = value;
  }

  String get pic => _pic;

  set pic(String value) {
    _pic = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}