class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{ first_name } #{ last_name }".strip
  end

end
