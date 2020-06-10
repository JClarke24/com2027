class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :email
  validates_format_of :email, :with => Devise::email_regexp
  attribute :file,      :attachment => true
  attribute :message,   :validate => true
  attribute :subject,   :validate => true
  attribute :current_student
  attribute :tutor_email

  def headers
    {
      :subject => "Contact Form from BeeSmart",
      :to =>  %(#{tutor_email}),
      :from =>%(#{current_student})
    }
  end
end
