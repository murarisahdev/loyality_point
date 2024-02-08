require "rails_helper"

RSpec.describe FreeCoffeeRewardJob, type: :job do
  describe "#perform_later" do
    it "assigns a loyalty tier to user" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        FreeCoffeeRewardJob.set(queue: "low").perform_later("free_coffee")
      end.to have_enqueued_job.with("free_coffee").on_queue("low").at(:no_wait)
    end
  end
end
