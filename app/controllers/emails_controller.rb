class EmailsController < ApplicationController
  def index
    @allMail = Email.all
  end

  def create
    @email = Email.create(object: Faker::TvShows::SiliconValley.company,
                 body: Faker::TvShows::SiliconValley.quote,
                 read: false)
    if(@email.save)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {     }
      end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end
end
