class Level {
  int _id;
  String _image;
  String _suggestion;
  int _difficult;
  List<dynamic> _correctAnswer;
  String _congratulations;
  String _backgroundColor;
  List<WrongAnswer> _wrongAnswer;

  Level(
      {int id,
      String image,
      String suggestion,
      int difficult,
      List<dynamic> correctAnswer,
      String congratulations,
      String backgroundColor,
      List<WrongAnswer> wrongAnswer}) {
    this._id = id;
    this._image = image;
    this._suggestion = suggestion;
    this._difficult = difficult;
    this._correctAnswer = correctAnswer;
    this._congratulations = congratulations;
    this._wrongAnswer = wrongAnswer;
    this._backgroundColor = backgroundColor;
  }

  int get id => _id;
  // set id(int id) => _id = id;
  String get image => _image;
  // set image(Null image) => _image = image;
  String get suggestion => _suggestion;
  // set suggestion(String suggestion) => _suggestion = suggestion;
  int get difficult => _difficult;
  // set difficult(int difficult) => _difficult = difficult;
  List<dynamic> get correctAnswer => _correctAnswer;
  // set correctAnswer(String correctAnswer) => _correctAnswer = correctAnswer;
  String get congratulations => _congratulations;

  String get backgroundColor => _backgroundColor;
  // set congratulations(String congratulations) =>
  // _congratulations = congratulations;
  List<WrongAnswer> get wrongAnswer => _wrongAnswer;
  // set wrongAnswer(List<WrongAnswer> wrongAnswer) => _wrongAnswer = wrongAnswer;

  Level.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _image = json['image'];
    _suggestion = json['suggestion'];
    _difficult = json['difficult'];
    _correctAnswer = json['correctAnswer'];
    _congratulations = json['congratulations'];
    _backgroundColor = json['backgroundColor'];
    if (json['wrongAnswer'] != null) {
      _wrongAnswer = new List<WrongAnswer>();
      json['wrongAnswer'].forEach((v) {
        _wrongAnswer.add(new WrongAnswer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['image'] = this._image;
    data['suggestion'] = this._suggestion;
    data['difficult'] = this._difficult;
    data['correctAnswer'] = this._correctAnswer;
    data['congratulations'] = this._congratulations;
    data['backgroundColor'] = this._backgroundColor;
    if (this._wrongAnswer != null) {
      data['wrongAnswer'] = this._wrongAnswer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WrongAnswer {
  String _userAnswer;
  String _tip;

  WrongAnswer({String userAnswer, String tip}) {
    this._userAnswer = userAnswer;
    this._tip = tip;
  }

  String get userAnswer => _userAnswer;
  // set userAnswer(String userAnswer) => _userAnswer = userAnswer;
  String get tip => _tip;
  // set tip(String tip) => _tip = tip;

  WrongAnswer.fromJson(Map<String, dynamic> json) {
    _userAnswer = json['userAnswer'];
    _tip = json['tip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userAnswer'] = this._userAnswer;
    data['tip'] = this._tip;
    return data;
  }
}
