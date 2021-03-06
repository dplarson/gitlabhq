class RemoveOldWebHookLogsWorker
  include Sidekiq::Worker
  include CronjobQueue

  WEB_HOOK_LOG_LIFETIME = 2.days

  def perform
    WebHookLog.destroy_all(['created_at < ?', Time.now - WEB_HOOK_LOG_LIFETIME])
  end
end
