extension JulianDate on DateTime {
  /// isLeapYear determines if the given DateTime is a leap year
  /// `DateTime.now().isLeapYear`
  bool get isLeapYear {
    if (year % 400 == 0) {
      return true;
    } else if (year % 100 == 0) {
      return false;
    } else if (year % 4 == 0) {
      return true;
    }
    return false;
  }

  // Section 3. Converting Date to Day Number
  /// This converts the date of the month to day number
  /// e.g. What is the day number of June 19 (not a leap year?) 170
  int get dayNumber {
    var month = this.month;
    if (month > 2) {
      month += 1;
      month = (month.toDouble() * 30.6).toInt();
      month = isLeapYear ? month -= 62 : month -= 63;
    } else {
      month -= 1;
      month = isLeapYear ? month * 62 : month * 63;
      month = month ~/ 2;
    }
    month += day;
    return month;
  }

  // dayAsFraction returns the day with the time as fraction
  // e.g. Midday of January 3 is, 3.5 (dayNumber 3 at 12:00PM)
  double get dayAsFraction {
    return day.toDouble() + (hour / 24.0);
  }

  // from Section 4. Julian Dates
  /// get the Julian Date of a DateTime object
  /// `DateTime.now().julianDate`
  double get julianDate {
    var utcnow = toUtc();
    var yPrime;
    var mPrime;
    if (utcnow.month == 1 || utcnow.month == 2) {
      yPrime = year - 1;
      mPrime = month + 12;
    } else {
      yPrime = year;
      mPrime = month;
    }

    var compare = DateTime(1582, 10, 15).toUtc();
    int A;
    int B;
    int C;
    int D;
    if (utcnow.isAfter(compare)) {
      A = yPrime ~/ 100;
      B = 2 - A + (A ~/ 4);
    } else {
      B = 0;
    }

    if (yPrime < 0) {
      C = ((365.25 * yPrime) - 0.75).floor();
    } else {
      C = (365.25 * yPrime).floor();
    }
    D = (30.6001 * (mPrime + 1)).floor();
    return B.toDouble() +
        C.toDouble() +
        D.toDouble() +
        dayAsFraction +
        1720994.5;
  }
}

enum MoonPhase {
  NewMoon,
  WaningCrescent,
  LastQuarter,
  WaningGibbous,
  Full,
  WaxingGibbous,
  FirstQuarter,
  WaxingCrescent,
}

/// Moon class has a convinience function `phase(DateTime)` which returns the moonPhase for a given time.
/// This Class relies on the JulianDate extension
class Moon {
  static MoonPhase phase(DateTime input) {
    var D = ageOfMoon(input);
    return getMoonPhase(D);
  }

  /// ageOfMoon returns the number of days since the latest New Moon
  /// This calculation was adapted from https://www.subsystems.us/uploads/9/8/9/4/98948044/moonphase.pdf
  static double ageOfMoon(DateTime input) {
    const lunarCycle = 29.53;
    final lastNewMoon = DateTime(2019, 1, 6, 1, 29);
    final daysSinceLastNewMooon = input.julianDate - lastNewMoon.julianDate;
    final newMoons = daysSinceLastNewMooon / lunarCycle;
    return (newMoons - newMoons.floor()) * lunarCycle;
  }

  /// Returns a MoonPhase
  // ignore: missing_return
  static MoonPhase getMoonPhase(double daysSinceNewMoon) {
    if (daysSinceNewMoon == 0 || daysSinceNewMoon == 29.5) {
      return MoonPhase.NewMoon;
    }

    if (daysSinceNewMoon > 0 && daysSinceNewMoon < 3.5) {
      return MoonPhase.NewMoon;
    }

    if (daysSinceNewMoon >= 3.5 && daysSinceNewMoon < 7) {
      return MoonPhase.WaxingCrescent;
    }

    if (daysSinceNewMoon >= 7 && daysSinceNewMoon < 11) {
      return MoonPhase.FirstQuarter;
    }

    if (daysSinceNewMoon >= 11 && daysSinceNewMoon < 15.0) {
      return MoonPhase.WaxingGibbous;
    }

    if (daysSinceNewMoon >= 15.0 && daysSinceNewMoon < 18.5) {
      return MoonPhase.Full;
    }

    if (daysSinceNewMoon >= 18.5 && daysSinceNewMoon < 22.0) {
      return MoonPhase.WaningGibbous;
    }

    if (daysSinceNewMoon >= 22.0 && daysSinceNewMoon < 25.7) {
      return MoonPhase.LastQuarter;
    }

    if (daysSinceNewMoon >= 25.7 && daysSinceNewMoon < 29.5) {
      return MoonPhase.WaningCrescent;
    }
  }
}