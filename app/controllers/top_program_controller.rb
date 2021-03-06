class TopProgramController < ApplicationController
  def challenge
    @applicant = TopApplicant.where("info -> 'uid' = ?", params[:uid]).take
    render :applicant_not_found and return if @applicant.nil?

    if @applicant.valid_code
      redirect_to top_program_test_path(uid: params[:uid])
    else
      @secret_code = Base64.encode64(@applicant.uid)
    end
  end

  def submit_challenge
    @applicant = TopApplicant.where("info -> 'uid' = ?", params[:uid]).take
    render :applicant_not_found and return if @applicant.nil?

    if has_completed_challenge(@applicant)
      redirect_to top_program_challenge_path
    else
      uid = Base64.decode64(params[:code])
      if uid == params[:uid] # check if challenge is valid
        @applicant.update!(valid_code: true)
        redirect_to top_program_challenge_path(uid: params[:uid])
      else
        @secret_code = Base64.encode64(@applicant.uid)
        @invalid_code = true
        render :challenge
      end
    end
  end

  def test
    applicant = TopApplicant.where("info -> 'uid' = ?", params[:uid]).take
    puts "Applicant: #{applicant.nil?}"
    render :applicant_not_found and return if applicant.nil?

    if !has_completed_challenge(applicant)
      redirect_to top_program_challenge_path(uid: params[:uid])
    elsif has_submitted_test(applicant)
      render :already_submitted
    else
      @test = TopApplicantTest.new(applicant: applicant)
    end
  end

  def submit_test
    applicant = TopApplicant.find_by(id: params[:applicant_id])
    render :applicant_not_found and return if applicant.nil?

    @test = TopApplicantTest.new(test_params.merge(applicant: applicant))
    if @test.save
      redirect_to top_program_submitted_path
    else
      render :test
    end
  end

  protected
    def test_params
      params.require(:top_applicant_test).permit(:a1, :a2, :a3, :a4)
    end

    def has_completed_challenge(applicant)
      applicant.valid_code
    end

    def has_submitted_test(applicant)
      TopApplicantTest.exists?(applicant: applicant)
    end
end
