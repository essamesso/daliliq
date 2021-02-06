import 'package:dalilaq/src/data/models/CategoriesModel.dart';
import 'package:dalilaq/src/data/models/CityMenu.dart';
import 'package:dalilaq/src/data/models/DayModel.dart';
import 'package:dalilaq/src/data/models/TimeMintModel.dart';
import 'package:dalilaq/src/data/models/TmieHoursModel.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AddAPageController extends ControllerMVC {
  //to make single instance of class
  factory AddAPageController() {
    if (_this == null) _this = AddAPageController._();
    return _this;
  }
  static AddAPageController _this;

  AddAPageController._();

  static AddAPageController get con => _this;
  List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "1",
      name: "beuty",
    ),
    CategoriesModel(
      id: "2",
      name: "elctronics",
    ),
    CategoriesModel(
      id: "3",
      name: "cars",
    )
  ];

  List<CityMenu> cityList = [
    CityMenu(
      id: "1",
      name: "Cairo",
    ),
    CityMenu(
      id: "2",
      name: "elmenufia",
    ),
    CityMenu(
      id: "3",
      name: "Algeza",
    )
  ];
  List<DayModel> dayList = [
    DayModel(
      id: "1",
      name: "Sunday",
    ),
    DayModel(
      id: "2",
      name: "Monday",
    ),
    DayModel(
      id: "3",
      name: "Tuesday",
    ),
    DayModel(
      id: "4",
      name: "Wed",
    ),
    DayModel(
      id: "5",
      name: "Thursday",
    ),
    DayModel(
      id: "6",
      name: "Friday",
    ),
    DayModel(
      id: "7",
      name: "Saturday",
    ),
  ];
  List<TimeHoursModel> hoursList = [
    TimeHoursModel(
      id: "1",
      name: "1",
    ),
    TimeHoursModel(
      id: "2",
      name: "2",
    ),
    TimeHoursModel(
      id: "3",
      name: "3",
    ),
    TimeHoursModel(
      id: "4",
      name: "4",
    ),
    TimeHoursModel(
      id: "5",
      name: "5",
    ),
    TimeHoursModel(
      id: "6",
      name: "6",
    ),
    TimeHoursModel(
      id: "7",
      name: "7",
    ),
    TimeHoursModel(
      id: "8",
      name: "8",
    ),
    TimeHoursModel(
      id: "9",
      name: "9",
    ),
    TimeHoursModel(
      id: "10",
      name: "10",
    ),
    TimeHoursModel(
      id: "11",
      name: "11",
    ),
    TimeHoursModel(
      id: "12",
      name: "12",
    ),
    TimeHoursModel(
      id: "13",
      name: "13",
    ),
    TimeHoursModel(
      id: "14",
      name: "14",
    ),
    TimeHoursModel(
      id: "15",
      name: "15",
    ),
    TimeHoursModel(
      id: "16",
      name: "16",
    ),
    TimeHoursModel(
      id: "17",
      name: "17",
    ),
    TimeHoursModel(
      id: "18",
      name: "18",
    ),
    TimeHoursModel(
      id: "19",
      name: "19",
    ),
    TimeHoursModel(
      id: "20",
      name: "20",
    ),
    TimeHoursModel(
      id: "21",
      name: "21",
    ),
    TimeHoursModel(
      id: "22",
      name: "22",
    ),
    TimeHoursModel(
      id: "23",
      name: "23",
    ),
    TimeHoursModel(
      id: "24",
      name: "24",
    ),
  ];
  List<TimeMintModel> mintList = [
    TimeMintModel(
      id: "1",
      name: "1",
    ),
    TimeMintModel(
      id: "2",
      name: "2",
    ),
    TimeMintModel(
      id: "3",
      name: "3",
    ),
    TimeMintModel(
      id: "4",
      name: "4",
    ),
    TimeMintModel(
      id: "5",
      name: "5",
    ),
    TimeMintModel(
      id: "6",
      name: "6",
    ),
    TimeMintModel(
      id: "7",
      name: "7",
    ),
    TimeMintModel(
      id: "8",
      name: "8",
    ),
    TimeMintModel(
      id: "9",
      name: "9",
    ),
    TimeMintModel(
      id: "10",
      name: "10",
    ),
    TimeMintModel(
      id: "11",
      name: "11",
    ),
    TimeMintModel(
      id: "12",
      name: "12",
    ),
    TimeMintModel(
      id: "13",
      name: "13",
    ),
    TimeMintModel(
      id: "14",
      name: "14",
    ),
    TimeMintModel(
      id: "15",
      name: "15",
    ),
    TimeMintModel(
      id: "16",
      name: "16",
    ),
    TimeMintModel(
      id: "17",
      name: "17",
    ),
    TimeMintModel(
      id: "18",
      name: "18",
    ),
    TimeMintModel(
      id: "19",
      name: "19",
    ),
    TimeMintModel(
      id: "20",
      name: "20",
    ),
    TimeMintModel(
      id: "21",
      name: "21",
    ),
    TimeMintModel(
      id: "22",
      name: "22",
    ),
    TimeMintModel(
      id: "23",
      name: "23",
    ),
    TimeMintModel(
      id: "24",
      name: "24",
    ),
    TimeMintModel(
      id: "25",
      name: "25",
    ),
    TimeMintModel(
      id: "26",
      name: "26",
    ),
    TimeMintModel(
      id: "27",
      name: "27",
    ),
    TimeMintModel(
      id: "28",
      name: "28",
    ),
    TimeMintModel(
      id: "29",
      name: "29",
    ),
    TimeMintModel(
      id: "30",
      name: "30",
    ),
    TimeMintModel(
      id: "31",
      name: "31",
    ),
    TimeMintModel(
      id: "32",
      name: "32",
    ),
    TimeMintModel(
      id: "33",
      name: "33",
    ),
    TimeMintModel(
      id: "34",
      name: "34",
    ),
    TimeMintModel(
      id: "35",
      name: "35",
    ),
    TimeMintModel(
      id: "36",
      name: "36",
    ),
    TimeMintModel(
      id: "37",
      name: "37",
    ),
    TimeMintModel(
      id: "38",
      name: "38",
    ),
    TimeMintModel(
      id: "39",
      name: "39",
    ),
    TimeMintModel(
      id: "40",
      name: "40",
    ),
    TimeMintModel(
      id: "41",
      name: "41",
    ),
    TimeMintModel(
      id: "42",
      name: "42",
    ),
    TimeMintModel(
      id: "43",
      name: "43",
    ),
    TimeMintModel(
      id: "44",
      name: "44",
    ),
    TimeMintModel(
      id: "45",
      name: "45",
    ),
    TimeMintModel(
      id: "46",
      name: "46",
    ),
    TimeMintModel(
      id: "47",
      name: "47",
    ),
    TimeMintModel(
      id: "48",
      name: "48",
    ),
    TimeMintModel(
      id: "49",
      name: "49",
    ),
    TimeMintModel(
      id: "50",
      name: "50",
    ),
    TimeMintModel(
      id: "51",
      name: "51",
    ),
    TimeMintModel(
      id: "52",
      name: "52",
    ),
    TimeMintModel(
      id: "53",
      name: "53",
    ),
    TimeMintModel(
      id: "54",
      name: "54",
    ),
    TimeMintModel(
      id: "55",
      name: "55",
    ),
    TimeMintModel(
      id: "56",
      name: "56",
    ),
    TimeMintModel(
      id: "57",
      name: "57",
    ),
    TimeMintModel(
      id: "58",
      name: "58",
    ),
    TimeMintModel(
      id: "59",
      name: "59",
    ),
    TimeMintModel(
      id: "60",
      name: "60",
    ),
  ];
}
