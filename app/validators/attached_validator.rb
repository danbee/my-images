class AttachedValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !value.attached?
      record.errors.add(attribute, :attached, options)
    end
  end
end
