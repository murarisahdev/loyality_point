require "rails_helper"

RSpec.describe BirthdayMonthRewardJob, type: :job do
  describe "#perform_later" do
    it "assigns a loyalty tier to user" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        BirthdayMonthRewardJob.set(queue: "low").perform_later("birthday_month")
      end.to have_enqueued_job.with("birthday_month").on_queue("low").at(:no_wait)
    end
  end
end
