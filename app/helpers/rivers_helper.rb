module RiversHelper

  def has_alert?(river)
    alerts = Alert.where(river_id: river.id)
    return !alerts.empty?
  end


end
