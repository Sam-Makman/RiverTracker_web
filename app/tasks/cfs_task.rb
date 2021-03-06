class CFSTask
  require 'net/http'

  @url_start = "http://waterservices.usgs.gov/nwis/iv/?format=json&sites="
  @url_end = "&parameterCd=00060"

  def self.update_cfs
    puts "updating"
    rivers = River.all
    sites = ''
    rivers.each { |river|
      if !river.usgs_id.nil? && river.usgs_id != ""
        sites = sites + river.usgs_id
        sites = sites + ',' if river != rivers.last!
      end
    }
    url = @url_start + sites + @url_end
    puts url
    # url = URI.parse(@url+sites)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed = JSON.parse(response)


    vals = parsed['value']['timeSeries']

    for site in vals do
      puts site
      id = site['sourceInfo']['siteCode'][0]['value']
      up_rivers = River.where(usgs_id: id)
      cfs = site['values'][0]['value'][0]['value']
      for river in up_rivers
        river.update(cfs: cfs)
      end
    end


  end
end
