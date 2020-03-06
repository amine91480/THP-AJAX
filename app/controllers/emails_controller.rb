class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {  }
      end
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
    end
  end

  def destroy

  @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {     }
    end
  end
end
