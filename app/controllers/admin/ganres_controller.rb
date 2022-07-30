class Admin::GanresController < ApplicationController

  def index
    @ganre = Ganre.new
    @ganres = Ganre.all
  end

  def create
    @ganre = Ganre.new(ganre_params)
    if @ganre.save
      redirect_to admin_ganres_path
      flash[:notice] = "登録が完了しました"
    end
  end

  def edit
    @ganre = Ganre.find(params[:id])
  end

  def update
    @ganre = Ganre.find(params[:id])
    if @ganre.update(ganre_params)
      redirect_to admin_ganres_path
      flash[:notice] = "編集が完了しました"
    else
      render "edit"
    end
  end

  private

  def ganre_params
    params.require(:ganre).permit(:name)
  end
end
