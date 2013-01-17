require 'formula'

class Sl < Formula
  homepage 'http://packages.debian.org/source/stable/sl'
  url 'http://mirrors.kernel.org/debian/pool/main/s/sl/sl_3.03.orig.tar.gz'
  mirror 'http://ftp.us.debian.org/debian/pool/main/s/sl/sl_3.03.orig.tar.gz'
  sha1 'd0a8e52ef649cd3bbf02c099e9991dc7cb9b60c3'

  fails_with :clang do
    build 318
  end

  def patches
    [
      "http://ftp.us.debian.org/debian/pool/main/s/sl/sl_3.03-16.diff.gz",
      "debian/patches/10_modify_Makefile.dpatch",
      "debian/patches/20_remove_SIGINT.dpatch",
      "debian/patches/30_add_-e_option.dpatch",
      "debian/patches/40_apply_sl-h.dpatch",
      "debian/patches/50_sigtstp.dpatch"
    ]
  end

  def install
    ENV.append 'LDFLAGS', '-lcurses'
    system "make -e"
    bin.install "sl"
    bin.install "sl-h"
    man6.install "debian/man/man6/sl.6"
    man6.install "debian/man/man6/sl-h.6"
  end
end
