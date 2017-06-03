cask 'my-r-212' do
    version '2.12.2'
    # sha generated from test download
    sha256 '1a0e692f30474560bc61fd404ebec19198347baf9f3b73a698818d6a8f95205f'
    url "http://cran.rstudio.com/bin/macosx/old/R-#{version}.pkg"
    pkg "R-#{version}.pkg"

  name 'R'
  homepage 'https://www.r-project.org/'
  license :gpl

  depends_on macos: '>= :snow_leopard'

  uninstall pkgutil: [
                       # eg org.r-project.R.maverics.fw.pkg
                       #   org.r-project.R.mavericks.GUI.pkg
                       'org\.r-project\.R\..*(fw|GUI)\.pkg',
                       # eg org.r-project.x86_64.tcltk.x11
                       'org.r-project\..*\.tcltk.x11',
                     ],
            delete:  [
                       # symlinks
                       '/usr/bin/R',
                       '/usr/bin/Rscript',
                       '/Library/Frameworks/R.Framework/Versions/Current',
                       # :pkgutil won't delete this dir if the fontconfig cache was written to at
                       # /Library/Frameworks/R.Framework/Versions/3.2/Resources/fontconfig/cache
                       '/Library/Frameworks/R.Framework/Versions/3.2',
                     ]

  zap       delete: [
                      '~/.R',
                      '~/.RData',
                      '~/.Rapp.history',
                      '~/.Rhistory',
                      '~/.Rprofile',
                      '~/Library/R',
                      '~/Library/Caches/org.R-project.R',
                    ]

  caveats do
    files_in_usr_local
  end
end
