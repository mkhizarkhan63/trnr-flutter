class DailyCheckInForm {
  String? date;
  String? amountOfFluid;
  String? numberOfSteps;
  String? weight;
  int? tiredness;
  int? pressure;
  int? strength;
  int? hunger;
  int? recovery;
  int? dailyEnergy;
  int? qualityOfSleep;
  String? hoursOfSleep;
  String? calories;
  String? notes;

  String validateData() {
    String errorMessage = "";
    if (date == null || date!.isEmpty) {
      errorMessage = "Please select date";
    } else if (amountOfFluid == null || amountOfFluid!.isEmpty) {
      errorMessage = "Please enter amount of fluids";
    } else if (numberOfSteps == null || numberOfSteps!.isEmpty) {
      errorMessage = "Please enter amount of fluids";
    } else if (weight == null || weight!.isEmpty) {
      errorMessage = "Please enter amount of fluids";
    } else if (tiredness == null) {
      errorMessage = "Please rate tiredness";
    } else if (pressure == null) {
      errorMessage = "Please rate pressure";
    } else if (strength == null) {
      errorMessage = "Please rate strength";
    } else if (hunger == null) {
      errorMessage = "Please rate hunger";
    } else if (recovery == null) {
      errorMessage = "Please rate recovery";
    } else if (dailyEnergy == null) {
      errorMessage = "Please rate daily energy";
    } else if (qualityOfSleep == null) {
      errorMessage = "Please rate quality of sleep";
    } else if (hoursOfSleep == null || hoursOfSleep!.isEmpty) {
      errorMessage = "Please enter hours of sleep";
    } else if (calories == null || calories!.isEmpty) {
      errorMessage = "Please enter calories";
    } else if (notes == null || notes!.isEmpty) {
      errorMessage = "Please enter notes";
    } else {
      errorMessage = "";
    }

    return errorMessage;
  }
}
