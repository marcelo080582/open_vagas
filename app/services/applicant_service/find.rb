module ApplicantService
  class Find
    attr_reader :user_id, :position_id

    def initialize(user_id, position_id)
      @user_id = user_id
      @position_id = position_id
    end

    def call
      find_applicant
    end

    private

    def find_applicant
      Applicant.where(user_id: user_id, position_id: position_id)
    end
  end
end
