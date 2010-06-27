pkgname=initscripts-git
pkgver=$(date +%s)
pkgrel=$(git log --pretty=format:%h |head -n 1)
pkgdesc="System initialization/bootup scripts"
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
groups=('base')
conflicts=('initscripts')
provides=('initscripts=9999')
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=('glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=139-1'
         'net-tools' 'ncurses' 'kbd' 'findutils' 'sysvinit')
optdepends=('bridge-utils: Network bridging support'
            'dhcpcd: DHCP network configuration'
            'wireless_tools: Wireless networking')
source=()
sha256sums=()

build() {
  cd ..
  DESTDIR=${pkgdir} ./install.sh
}
