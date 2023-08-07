import 'package:get/get.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

class TelegramService extends GetxService {
  final token = '......';
  final chatId = '......';

  late final String? username;
  late TeleDart teledart;

  @override
  Future<void> onInit() async {
    super.onInit();
    username = (await Telegram(token).getMe()).username;
    teledart = TeleDart(token, Event(username!));
  }

  @override
  void onClose() {
    teledart.close();
    super.onClose();
  }

  void send({required MessageFormat textFormatt, String? name}) {
    final textPatterns = {
      MessageFormat.interview: '$name подошел(а) на собеседование',
      MessageFormat.internship: 'Человек подошел на стажировку',
      MessageFormat.meetingAgent: '$name подошел(а) на встречу с агентом',
      MessageFormat.meetingOther:
          '$name подошел(а) на встречу с другим специалистом',
    };
    teledart.sendMessage(chatId, textPatterns[textFormatt]!);
  }
}

enum MessageFormat {
  interview,
  internship,
  meetingAgent,
  meetingOther,
}
