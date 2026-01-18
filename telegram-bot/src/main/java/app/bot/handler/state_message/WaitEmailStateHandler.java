package app.bot.handler.state_message;

import app.bot.sender.TelegramMessageSender;
import app.bot.state.UserState;
import app.bot.state.UserStateService;
import app.bot.email.EmailService;
import app.core.broadcast.SubscriberService;
import app.module.node.texts.BotTextService;
import app.module.node.texts.TextMarker;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;

@Component
@RequiredArgsConstructor
public class WaitEmailStateHandler implements StateMessageHandler {

  private final SubscriberService subscriberService;
  private final EmailService emailService;
  private final BotTextService textService;
  private final UserStateService stateService;
  private final TelegramMessageSender sender;

  @Override
  public UserState state() {
    return UserState.WAIT_EMAIL;
  }

  @Override
  public void handle(Update update) {
    Long chatId = update.getMessage().getChatId();
    String input = update.getMessage().getText();

    String code = subscriberService.getCode(chatId);

    if (!input.equals(code)) {
      sender.sendMessage(
          new SendMessage(chatId.toString(), textService.format(TextMarker.MAIL_ERROR))
      );
      return;
    }

    subscriberService.setVerified(chatId);
    stateService.setState(chatId, UserState.DEFAULT);

    sender.sendMessage(
        new SendMessage(chatId.toString(), textService.format(TextMarker.MAIL_SUCCESS))
    );
  }
}
