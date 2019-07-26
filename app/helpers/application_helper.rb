# frozen_string_literal: true

module ApplicationHelper

  def td_for(model, attr)
    tooltip_title = ''

    model.valid?
    model.errors[attr].each do |msg|
      tooltip_title += "#{msg}\n"
    end

    attr_hash = { class: ('alert-danger' unless model.valid_attribute?(attr)),
                  data: { toggle: 'tooltip', placement: 'top', html: 'true' },
                  title: tooltip_title }

    haml_tag :td, attr_hash do
      haml_concat model[attr]
    end

  end
end
