require "rails_helper"

RSpec.describe ExpirePointsJob, type: :job do
  describe "#perform_later" do
    it "assigns a loyalty tier to user" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        ExpirePointsJob.set(queue: "low").perform_later("expire_point")
      end.to have_enqueued_job.with("expire_point").on_queue("low").at(:no_wait)
    end
  end
end
