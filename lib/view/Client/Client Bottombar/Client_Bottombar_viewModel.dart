import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/view/Client/Client%20Calendar/ClientCalendar_view.dart';

import '../C - Trainer sec/Client k Trainer/ClientTrainer_view.dart';
import '../Client Chatting Pages/chat/ClientChat_view.dart';
import '../Client Home Pages/Client Home/Client-Home-view/ClientHomeContentView.dart';

class ClientBottombarViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  int navIndex = 0;

  final List<Map> bottomTabs = [
    {
      'icon': "lib/assets/Icons/home.png",
      // 'nav': ClientBottombarViewModel().navigateToClientHomeView(),
      'name': '/client-home-view',
      'selected': true,
    },
    {
      'icon': "lib/assets/Icons/whistle.png",
      // 'nav': ClientBottombarViewModel().navigateToClientTrainerView(),
      'name': '/client-trainer-view',
      'selected': false,
    },
    {
      'icon': "lib/assets/Icons/chat.png",
      // 'nav': ClientBottombarViewModel().navigateToClientChatView(),
      'name': '/client-chat-view',
      'selected': false,
    },
    {
      'icon': "lib/assets/Icons/calender.png",
      // 'nav': ClientBottombarViewModel().navigateToClientCalendar(),
      'name': '/client-calendar-view',
      'selected': false,
    },
  ];

  final bottomNavHistory = [];

  final screensList = [
    const ClientHomeContentView(),
    const ClientTrainerView(),
    const ClientChatView(),
    const ClientCalendarView()
  ];

  void selectBottomTab({required int i}) {
    for (var tabs in bottomTabs) {
      tabs['selected'] = false;
    }
    bottomTabs[i]['selected'] = true;
    navIndex = i;
    rebuildUi();
  }
}
