class AlertsController < ApplicationController

  def index
    @alerts = Alert.all
  end

  def create
    @alert = Alert.new(alert_params)
    if @alert.valid? && @alert.save
      redirect_to alerts_path
    else
      redirect_to root_path
    end
  end

  def destroy
  end

  private
  def alert_params
    params.require(:alert).permit(:river_id, :title, :details)
  end
end
