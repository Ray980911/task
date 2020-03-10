class NoticeMailer < ApplicationMailer

  def sendmail_task(task)
    @task = task
    mail to: ENV['TASK_EMAIL'], subject: "新規タスクが作成されました"
  end

end
