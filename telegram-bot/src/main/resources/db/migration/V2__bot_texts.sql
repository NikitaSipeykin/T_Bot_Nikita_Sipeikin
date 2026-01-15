CREATE TABLE IF NOT exists bot_texts  (
  id VARCHAR(255) PRIMARY KEY,
  value TEXT NOT NULL,
  handler VARCHAR(255)
);

INSERT INTO public.bot_texts (id,value,handler) VALUES
	 ('START','Привет, %s! 👋 Я — Telegram-бот, который умеет продавать, обучать и автоматизировать процессы.

                             Но есть нюанс 😏
                             Я *покажу* это на себе, а не просто расскажу.

                             Выбирай:',
                             'StartCommandHandler'),
	 ('PAYMENT','PAYMENT','PAYMENT'),
	 ('NEED_PAYMENT','Похоже вы еще не завершили оплату!','NeedPaymentMessageHandler'),
	 ('BROADCAST_FAIL','Произошла ошибка во время отправки рассылки','BroadcastCommandHandler'),
     ('UNSUBSCRIBE','Вы успешно отписались','UnsubscribeCommandHandler'),
     ('BROADCAST_SUCCESS','Рассылка отправлена!','BroadcastCommandHandler'),
     ('MENU_DEFAULT','еще не готово','MenuCommandHandler'),
	 ('ERROR','Что-то пошло не так!','DefaultMessageHandler');

INSERT INTO public.bot_texts (id,value,handler) VALUES
	 ('PROJECT_DESCRIPTION_BUTTON_YES','Да, записаться!','IntroPaymentCallbackHandler'),
	 ('PROJECT_DESCRIPTION_BUTTON_INFO','Расскажи подробнее','IntroPaymentCallbackHandler'),
	 ('PAYMENT_CHOOSE_CURRENCY','Выберите валюту для оплаты','PaymentCallbackHandler'),
	 ('PAYMENT_ERROR','Сейчас оплата не доступна. Попробуйте вызвать меню','PaymentCallbackHandler'),
     ('SEND_INVOICE_TITLE','Доступ к программе','SendInvoicePaymentCallbackHandler'),
     ('SEND_INVOICE_DESCRIPTION','Полный доступ к программе','SendInvoicePaymentCallbackHandler'),
     ('SEND_INVOICE_LABEL','Доступ','SendInvoicePaymentCallbackHandler'),
     ('CURRENCY_CHOOSE_ANOTHER','Выбрать другую валюту!','SendInvoicePaymentCallbackHandler'),
     ('CURRENCY_ERROR','Оплата в данной валюте временно недоступна','SendInvoicePaymentCallbackHandler'),
	 ('CURRENCY_CHOOSE_BUTTON_BACK','Назад','SendInvoicePaymentCallbackHandler');

INSERT INTO public.bot_texts (id,value,handler) VALUES
	 ('ADMIN_QUESTION_USER_WARN','Следующее сообщение будет отправлено напрямую админу!','AdminQuestionCommandHandler'),
	 ('START_COMMAND_USERNAME_FILLER','друг','StartCommandHandler'),
	 ('STEP_BACK','Хотите вернуться к описанию курса?','StepBackMessageHandler'),
	 ('STEP_BACK_BUTTON_YES','Да','StepBackMessageHandler'),
     ('PAYMENT_PROJECT_INTRO','✅ Оплата прошла успешно! Добро пожаловать в программу','SuccessPaymentMessageHandler'),
     ('PAYMENT_PROJECT_INTRO_BUTTON','Начать','SuccessPaymentMessageHandler'),
     ('MAIL_ERROR','Неверный код! Попробуй снова.','WaitEmailStateHandler'),
     ('MAIL_SUCCESS','Отлично! Вот твой подарок 🎁','WaitEmailStateHandler');