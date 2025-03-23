import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/view/Trainer/TCalendar/tCalendar_view.dart';
import 'package:trainr/view/Trainer/TProfile/TProfileContentView.dart';

import '../TChat/tChatContacts/tChatContacts_view.dart';
import '../TContacts/tContacts_view.dart';

class TBottomNavViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int navIndex = 0;

  final List<Map> bottomTabs = [
    {
      'icon': "lib/assets/Icons/home.png",
      // 'nav': ClientBottombarViewModel().navigateToClientHomeView(),
      'name': '/t-profile-view',
      'selected': true,
    },
    {
      'icon': "lib/assets/Icons/users.png",
      // 'nav': ClientBottombarViewModel().navigateToClientTrainerView(),
      'name': '/t-contacts-view',
      'selected': false,
    },
    {
      'icon': "lib/assets/Icons/chat.png",
      // 'nav': ClientBottombarViewModel().navigateToClientChatView(),
      'name': '/t-chat-contacts-view',
      'selected': false,
    },
    {
      'icon': "lib/assets/Icons/calender.png",
      // 'nav': ClientBottombarViewModel().navigateToClientCalendar(),
      'name': '/t-calendar-view',
      'selected': false,
    },
  ];

  final screenList = [
    TProfileContentView(),
    const TContactsView(),
    const TChatContactsView(),
    const TCalendarView()
  ];

  void selectBottomTab({required int i}) {
    for (var tabs in bottomTabs) {
      tabs['selected'] = false;
    }

    bottomTabs[i]['selected'] = true;
    navIndex = i;

    rebuildUi();
  }

  navigateToHome() {
    _navigationService.navigateToTProfileView();
  }

  navigateToContacts() {
    _navigationService.navigateToTContactsView();
  }

  navigateToChat() {
    _navigationService.navigateToTChatContactsView();
  }

  navigateToCalendar() {
    _navigationService.navigateToTCalendarView();
  }
}
