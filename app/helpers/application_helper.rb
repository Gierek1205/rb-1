module ApplicationHelper
  
  def truncate(s, max=70, elided = ' ...')
    s.match( /(.{1,#{max}})(?:\s|\z)/ )[1].tap do |res|
      res << elided unless res.length == s.length
    end
  end

end
