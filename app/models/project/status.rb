module Project::Status
  extend ActiveSupport::Concern

  STATUSES = %w[ created in_progress on_hold completed ]

  included do
    has_many :status_changes, dependent: :destroy

    before_create :record_status_change
  end

  def current_status
    last_status_change.status
  end

  private

    def record_status_change
      status_changes.new(user: user, status: :created)
    end

    def last_status_change
      status_changes.order(:created_at).last
    end
end
