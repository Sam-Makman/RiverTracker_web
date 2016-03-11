class CFSTask
  require 'net/http'

  @url = "http://waterservices.usgs.gov/nwis/iv/?format=json&parameterCd=00060@sites="

  def update_cfs
    puts
    rivers = River.all
    sites = ""
    for river in rivers do
      sites = sites + river.usgs_id if !river.usgs_id.nil?
      sites = sites + ',' if river != rivers[rivers.len -1]
    end
    url = URI.parse(@url+sites)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    puts res
  end

end