class CFSTask
  require 'net/http'

  @url = "http://waterservices.usgs.gov/nwis/iv/?format=json&parameterCd=00060@sites="



  def update_cfs
    rivers = River.all
    sites = ""
    for river in rivers do
      sites = sites + river.usgs_id if !river.usgs_id.nil?
      sites = sites + ',' if river == rivers[rivers.len -1]
    end

    # req = Net::HTTP::Get.new()
  end
end