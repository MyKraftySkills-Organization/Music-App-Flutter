class Song {
  String _name;
  String _aName;
  String _url;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return _name + _aName + _url;
  }

  String get aName => _aName;

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  set aName(String value) {
    _aName = value;
  }
}
