module ApplicationHelper
  def external_resources
    return nil if Rails.env.test?

    render 'common/external_resources'
  end
end
