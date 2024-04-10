class PersonPresenter
  attr_reader :person
  delegate :id, :name, :email, to: :person

  def initialize(person)
    @person = person
  end

  def image
    return '' unless @person.image

    helpers.image_tag(@person.image.to_s).html_safe
  end

  def admin
    @person.admin ? 'Sim' : 'Não'
  end

  def born_at
    helpers.l(@person.born_at)
  end

  def password
    '*' * 10
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
