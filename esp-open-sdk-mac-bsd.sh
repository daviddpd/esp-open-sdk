#!/bin/sh

OS=`uname`
FREEBSD=0
MACOS=0
case ${OS} in
	FreeBSD)
		FREEBSD=1
	;;
	Darwin)
		MACOS=1
	;;
	*)
esac 

# install dependent packages

if [ ${FREEBSD} = 1 ]; then 
	sudo pkg install git autoconf automake bash bison bzip2 cloog expat flex gawk gcc gerf git gmp gperf gsed gpatch help2man isl libexpat libtool makeinfo mpc mpfr ncurses patch py27-serial sed texinfo textinfo unrar unzip wget
elif [ ${MACOS} = 1 ]; then 
	brew install autoconf automake binutils cloog expat gawk gettext gmp gnu-sed gperftools gpatch help2man isl libelf libiconv libtool mpc mpfr ncurses ppl unrar wget
fi


# setup PATH

if [ ${FREEBSD} = 1 ]; then 
	export PATH="$PATH:/usr/local/bin"
elif [ ${MACOS} = 1 ]; then 
	export PATH="$PATH:/usr/local/Cellar/binutils/2.32/bin:/usr/local/Cellar/ncurses/6.1/bin:/usr/local/Cellar/gpatch/2.7.6/bin"
fi




# call make

if [ ${FREEBSD} = 1 ]; then 
	gmake STANDALONE=y FREEBSD=1
elif [ ${MACOS} = 1 ]; then 
	make STANDALONE=y MACOS=1
fi

