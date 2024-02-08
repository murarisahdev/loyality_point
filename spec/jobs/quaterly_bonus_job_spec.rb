require "rails_helper"

RSpec.describe QuaterlyBonusJob, type: :job do
  describe "#perform_later" do
    it "assigns a loyalty tier to user" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        QuaterlyBonusJob.set(queue: "low").perform_later("quaterly_bonus")
      end.to have_enqueued_job.with("quaterly_bonus").on_queue("low").at(:no_wait)
    end
  end
end
