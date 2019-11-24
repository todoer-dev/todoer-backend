# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :title, :labels, :is_starred, :description, :due_date, :completed_at
             :created_at
end
