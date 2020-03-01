class NoticeMailer < ApplicationMailer

  def sendmail_task(task)
    @task = task
    mail to: "rayreds1830@gmail.com", subject: "新規タスクが作成されました"
  end

end
