TERMUX_PKG_HOMEPAGE=https://github.com/jtyr/gbt
TERMUX_PKG_DESCRIPTION="Highly configurable prompt builder for Bash and ZSH written in Go"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_VERSION=1.2.0
TERMUX_PKG_REVISION=2
TERMUX_PKG_SRCURL=https://github.com/jtyr/gbt/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=eb309bb93e01ee168a528fb0ed3a4920a702a9dad5a8f205642717086b9162a0

termux_step_make_install() {
	cd $TERMUX_PKG_SRCDIR

	termux_setup_golang

	export GOPATH=$HOME/go
	mkdir -p $GOPATH/{bin,pkg,src/github.com/jtyr}
	ln -fs $TERMUX_PKG_SRCDIR $GOPATH/src/github.com/jtyr/gbt

	go build -ldflags='-s -w' -o $TERMUX_PREFIX/bin/gbt github.com/jtyr/gbt/cmd/gbt

	mkdir -p $TERMUX_PREFIX/{doc/gbt,share/gbt}
	cp -r $TERMUX_PKG_SRCDIR/{sources,themes} $TERMUX_PREFIX/share/gbt/
	cp -r $TERMUX_PKG_SRCDIR/{LICENSE,README.md} $TERMUX_PREFIX/doc/gbt/
}
