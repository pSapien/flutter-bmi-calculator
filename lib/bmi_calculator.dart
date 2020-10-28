class BMICalculator {
  static const male = 'male';
  static const female = 'female';

  String _selectedGender = '';

  bool isMale() => _selectedGender == male;
  bool isFemale() => _selectedGender == female;
  void setMale() => _selectedGender = male;
  void setFemale() => _selectedGender = female;
}
