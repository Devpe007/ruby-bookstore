class EmailValidator < ActiveModel::EachValidator
    EXPRESSION = /\A[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}\z/

    def validate_each(record, attr, value)
        return true if value.blank? || value.match?(EXPRESSION)
        record.errors[attr] << message
    end

    private

    def message
        return options[:message] if options[:message].present?
        I18n.t('activerecord.errors.messages.invalid_email', default: 'deve ser um email válido')
    end
end