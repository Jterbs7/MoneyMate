class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :award_badge

  def show
    @current_month_badge = current_user.profile.profile_badges.where(month: Time.now.month).first.badge
    @profile_badges = current_user.profile.profile_badges.where(month: 1..5)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.create_profile(profile_params)

    if @profile.save
      flash[:notice] = 'Profile was successfully created.'
      redirect_to @profile
    else
      flash.now[:alert] = 'There was an error creating the profile.'
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Profile was successfully updated.'
      redirect_to @profile
    else
      flash.now[:alert] = 'There was an error updating the profile.'
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :second_name, :username, :age, :monthly_income)
  end
end
