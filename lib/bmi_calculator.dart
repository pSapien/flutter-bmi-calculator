class BMICalculator {
  static const male = 'male';
  static const female = 'female';

  String _selectedGender = '';
  double _height = 90;
  double _minHeight = 75;
  double _maxHeight = 200;
  int _weight = 60;
  int _age = 16;

  bool isMale() => _selectedGender == male;
  bool isFemale() => _selectedGender == female;
  void setMale() => _selectedGender = male;
  void setFemale() => _selectedGender = female;

  void setHeight(userHeight) => _height = userHeight;
  double getHeight() => _height;
  double getMaxHeight() => _maxHeight;
  double getMinHeight() => _minHeight;

  int getWeight() => _weight;
  void setWeight(userWeight) => _weight = userWeight;

  int getAge() => _age;
  void setAge(userAge) => _age = userAge;
}
