class Viewer < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_event
end
