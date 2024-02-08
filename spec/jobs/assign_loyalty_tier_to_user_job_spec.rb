require "rails_helper"

RSpec.describe AssignLoyaltyTierToUserJob, type: :job do
  describe "#perform_later" do
    it "assigns a loyalty tier to user" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        AssignLoyaltyTierToUserJob.set(queue: "low").perform_later("loyalty_tier")
      end.to have_enqueued_job.with("loyalty_tier").on_queue("low").at(:no_wait)
    end
  end
end
