import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Validation.dart';
import 'package:weds360/pages/guest_list/models/age_category.dart';
import 'package:weds360/pages/guest_list/models/guest_model.dart';
import 'package:weds360/pages/guest_list/models/invitation_stutes.dart';

class GuestListProvider extends ChangeNotifier {
  List<GuestModel> guestList = [
    GuestModel(
        name: 'Ali Motie',
        email: 'amotie@outlook.com',
        phone: '01001289970',
        age: AgeCategory.OLD,
        invitationStatus: InvitationStatus.ACCEPTED),
    GuestModel(
        name: 'Ali Motie',
        email: 'amotie@outlook.com',
        phone: '01001289970',
        age: AgeCategory.OLD,
        invitationStatus: InvitationStatus.DECLINED),
    GuestModel(
        name: 'Ali Motie',
        email: 'amotie@outlook.com',
        phone: '01001289970',
        age: AgeCategory.OLD,
        invitationStatus: InvitationStatus.INVITED),
  ];
  GuestModel guestModel = new GuestModel();
  bool _isEmailValid = true;
  bool _isNameValid = true;
  bool _isPhoneValid = true;
  AgeCategory _selctedAge = AgeCategory.OLD;
  Widget getGeustStutes(InvitationStatus invitationStatus) {
    switch (invitationStatus) {
      case InvitationStatus.ACCEPTED:
        return Icon(
          Icons.check_circle,
          color: Colors.green,
        );
        break;
      case InvitationStatus.DECLINED:
        return Icon(
          Icons.dangerous,
          color: Colors.red,
        );
      case InvitationStatus.INVITED:
        return Icon(
          Icons.access_time_rounded,
          color: Colors.yellow[700],
        );
      default:
        return Icon(
          Icons.access_time_rounded,
          color: Colors.yellow[700],
        );
    }
  }

  void onNameChanged(String value) {
    guestModel.name = value;
  }

  void onEmailChanged(String value) {
    guestModel.email = value;
  }

  void onPhoneChange(String value) {
    guestModel.phone = value;
  }

  void addNewGuest(BuildContext context) {
    nameValdation(guestModel.name);
    emailValidation(guestModel.email);
    phoneValdation(guestModel.phone);
    if (_isEmailValid && _isNameValid && _isPhoneValid) {
      guestList.add(guestModel);
      guestModel = GuestModel();
      Navigator.pop(context);
    }
    notifyListeners();
  }

  int getAceptedLenth() {
    int count = guestList
        .where(
            (element) => element.invitationStatus == InvitationStatus.ACCEPTED)
        .toList()
        .length;
    return count;
  }

  int getDeclinedLenth() {
    int count = guestList
        .where(
            (element) => element.invitationStatus == InvitationStatus.DECLINED)
        .toList()
        .length;
    return count;
  }

  int getInvitedLenth() {
    int count = guestList
        .where(
            (element) => element.invitationStatus == InvitationStatus.INVITED)
        .toList()
        .length;
    return count;
  }

  void emailValidation(String value) {
    _isEmailValid = Validation.emailValidation(value);
    notifyListeners();
  }

  void nameValdation(String name) {
    _isNameValid = Validation.nameValidation(name);
    notifyListeners();
  }

  void phoneValdation(String phone) {
    _isPhoneValid = Validation.phoneValidation(phone);
    notifyListeners();
  }

  void onSelctedAge(String age) {
    if (age == 'OLD') {
      _selctedAge = AgeCategory.OLD;
    } else {
      _selctedAge = AgeCategory.YOUNG;
    }

    notifyListeners();
  }

  bool get isEmailValid {
    return _isEmailValid;
  }

  bool get isNameValid {
    return _isNameValid;
  }

  bool get isPhoneValid {
    return _isPhoneValid;
  }

  String get selectedAge {
    if (_selctedAge == AgeCategory.OLD) {
      return 'OLD';
    } else {
      return 'YOUNG';
    }
  }
}
