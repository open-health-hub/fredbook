class Preference < ActiveRecord::Base
	belongs_to :user

	CARE_DATA_SETTING_VALUES = { 10 => "text for 10", 20 => "text for 20", 30 => "text for 30", 40 => "text for 40", 50 => "text for 50", 60 => "text for 60", 70 => "text for 70" }
end