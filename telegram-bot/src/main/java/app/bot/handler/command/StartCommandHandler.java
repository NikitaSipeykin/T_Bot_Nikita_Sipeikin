package app.bot.handler.command;

import app.bot.bot.CommandKey;
import app.bot.bot.responce.*;
import app.bot.facade.AnalyticsFacade;
import app.bot.keyboard.KeyboardFactory;
import app.bot.keyboard.KeyboardOption;
import app.bot.state.UserState;
import app.bot.state.UserStateService;
import app.core.broadcast.SubscriberService;
import app.module.node.texts.BotTextService;
import app.module.node.texts.TextMarker;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.objects.Message;

import java.util.ArrayList;
import java.util.Collections;

@Component
@RequiredArgsConstructor
public class StartCommandHandler implements CommandHandler {

  private final BotTextService textService;
  private final UserStateService userStateService;
  private final SubscriberService subscriberService;

  private final AnalyticsFacade analytics;

  @Override
  public String command() {
    return "/start";
  }

  @Override
  public BotResponse handle(Message message) {
    Long chatId = message.getChatId();
    String firstName = message.getFrom().getFirstName();
    String username = message.getFrom().getUserName();
    String language = message.getFrom().getLanguageCode();

    subscriberService.subscribe(chatId, username, firstName, language);

    analytics.trackSubscribe(message, true);
    analytics.trackBlockView(chatId, "PROGRAM_CONTINUE");

    CompositeResponse compositeResponse = new CompositeResponse(new ArrayList<>());

    TextResponse text = new TextResponse(chatId,
        textService.format(
            TextMarker.START,
            firstName != null ? firstName : textService.format(TextMarker.START_COMMAND_USERNAME_FILLER)),
        null);

    compositeResponse.responses().add(text);

    return compositeResponse;
  }
}

