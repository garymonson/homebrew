require 'formula'

class Dmd < Formula
  homepage 'http://www.digitalmars.com/d/'
  url 'https://github.com/downloads/D-Programming-Language/dmd/dmd.2.058.zip'
  md5 '81a0fe7b635d3a38ecbefff6048a37fe'

  def doc
    #use d and not dmd, rationale: meh
    prefix+'share/doc/d'
  end

  def install
    ohai "Installing dmd"

    # clean it up a little first
    Dir['src/*.mak'].each {|f| File.unlink f}
    mv 'license.txt', 'COPYING'
    mv 'README.TXT', 'README'
    mv 'src/phobos/phoboslicense.txt', 'src/phobos/COPYING.phobos'

    prefix.install 'osx/lib'
    prefix.install 'osx/bin'
    prefix.install 'src'
    man.install 'man/man1'

    (prefix+'src/dmd').rmtree # we don't need the dmd sources thanks
    man5.install man1+'dmd.conf.5' # oops
    (share+'d/examples').install Dir['samples/d/*.d']

    (bin+'dmd.conf').open('w') do |f|
      f.puts "[Environment]"
      f.puts "DFLAGS=-I#{prefix}/src/phobos -I#{prefix}/src/druntime/import"
    end
  end
end
