class Preference < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :care_data_privacty_setting

	CARE_DATA_SETTING_VALUES = { 10 => "Allow my personal health data to be used for secondary uses.", 
		20 => "In fully identifiable form - including my name, date of birth, address and other personal information.", 
		30 => "In pseudonymised form by researchers for the public good only.", 
		40 => "In pseudonymised form by anyone, including researchers and private companies.", 
		50 => "In anonymised form, for public health and statistics.", 
		60 => "Allow me to decide for each individual secondary use request.", 
		70 => "Do not allow my personal health data to be used for secondary uses." }
end