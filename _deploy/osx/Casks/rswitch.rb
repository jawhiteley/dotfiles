cask 'rswitch' do
    version '1.2'
    # sha generated from test download
    sha256 'cfc0cb421ed69dd7920c029a609135c8b94ad557923ff4b385ea33f6fc3d6bdf'
    url "http://r.research.att.com/RSwitch-#{version}.dmg"

  name 'RSwitch'
  homepage 'http://r.research.att.com/#other'
  license :gpl

  app 'RSwitch.app'

end
