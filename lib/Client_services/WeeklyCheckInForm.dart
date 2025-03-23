class WeeklyCheckInForm {
  String? date;
  String? commitRate;
  String? howDoYouFeel;
  String? suggestSomething;
  String? weight;
  int? tiredness;
  int? pressure;
  int? strength;
  int? hunger;
  int? recovery;
  int? dailyEnergy;
  int? qualityOfSleep;
  String? hoursOfSleep;
  String? steps;
  String? armSize;
  String? chestSize;
  String? stomachSize;
  String? waistSize;
  String? thighSize;

  String validateData() {
    String errorMessage = "";
    if (date == null || date!.isEmpty) {
      errorMessage = "Please select date.";
    } else if (commitRate == null || commitRate!.isEmpty) {
      errorMessage = "Please enter commitment rate.";
    } else if (howDoYouFeel == null || howDoYouFeel!.isEmpty) {
      errorMessage = "Please enter how do you feel this week.";
    } else if (suggestSomething == null || suggestSomething!.isEmpty) {
      errorMessage = "Please enter suggestion.";
    } else if (weight == null || weight!.isEmpty) {
      errorMessage = "Please enter weight.";
    } else if (hoursOfSleep == null || hoursOfSleep!.isEmpty) {
      errorMessage = "Please enter hour of sleep.";
    } else if (qualityOfSleep == null) {
      errorMessage = "Please rate quality of sleep.";
    } else if (pressure == null) {
      errorMessage = "Please rate pressure.";
    } else if (tiredness == null) {
      errorMessage = "Please rate tiredness.";
    } else if (hunger == null) {
      errorMessage = "Please rate hunger.";
    } else if (recovery == null) {
      errorMessage = "Please rate recovery.";
    } else if (dailyEnergy == null) {
      errorMessage = "Please rate daily energy.";
    } else if (steps == null || steps!.isEmpty) {
      errorMessage = "Please enter steps.";
    } else if (armSize == null || armSize!.isEmpty) {
      errorMessage = "Please enter arm size.";
    } else if (chestSize == null || chestSize!.isEmpty) {
      errorMessage = "Please enter chest size.";
    } else if (stomachSize == null || stomachSize!.isEmpty) {
      errorMessage = "Please enter stomach size.";
    } else if (waistSize == null || waistSize!.isEmpty) {
      errorMessage = "Please enter waist size.";
    } else if (thighSize == null || thighSize!.isEmpty) {
      errorMessage = "Please enter thigh size.";
    } else {
      errorMessage = "";
    }

    return errorMessage;
  }
}
