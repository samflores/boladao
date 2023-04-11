require "administrate/field/base"

class CheckboxField < Administrate::Field::Base
  def to_s
    data
  end
end
