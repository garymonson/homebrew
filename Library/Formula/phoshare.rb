require 'formula'

class Phoshare < Formula
    homepage 'https://code.google.com/p/phoshare/'
    url 'https://phoshare.googlecode.com/files/Phoshare-1.5.1.zip'
    sha1 '5b4d84839266d1705369297148c9e33c3731cb62'

    depends_on 'exiftool'

    def install
        unzip_dir = File.join(Dir.pwd, '..')
        prefix.install File.join(unzip_dir, 'Phoshare-1.5.1.app')
        ln_s File.join(prefix, 'Phoshare-1.5.1.app'), File.join('/Applications', 'Phoshare')
    end
end
