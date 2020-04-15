class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :edit, :update]
  def index
    @talks = Talk.all
  end
  def new
    @talk = Talk.new
  end
  def create
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to talks_path, notice: "トークを作成しました！"
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @talk.update(talk_params)
      redirect_to talks_path, notice: "トークを編集しました！"
    else
      render :edit
    end
  end
  private
  def talk_params
    params.require(:talk).permit(:content)
  end
  def set_talk
    @talk = Talk.find(params[:id])
  end
end
