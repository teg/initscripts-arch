pkgname=initscripts-git
pkgver=$(date +%s)
pkgrel=$(git log -1 --pretty=format:%h)
pkgdesc="System initialization/bootup scripts"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
groups=('base')
conflicts=('initscripts')
provides=('initscripts=9999')
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
makedepends=('asciidoc')
depends=('glibc' 'bash' 'grep' 'coreutils' 'udev>=174' 'iproute2'
         'ncurses' 'kbd' 'findutils' 'sysvinit')
optdepends=('net-tools: legacy networking support'
            'bridge-utils: Network bridging support'
            'dhcpcd: DHCP network configuration'
            'wireless_tools: Wireless networking')
makedepends=(asciidoc)
source=()
sha256sums=()

build() {
  cd ..
  make
}

package() {
  cd ..
  make DESTDIR="$pkgdir" install
}
