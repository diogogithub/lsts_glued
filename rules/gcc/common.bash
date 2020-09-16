version=\
(
    '10.2.0'
)

url=\
(
    "http://mirrors.kernel.org/gnu/gcc/gcc-$version/gcc-$version.tar.xz"
)

md5=\
(
    'e9fd9b1789155ad09bcf3ae747596b50'
)

build_dir=$pkg_var

post_unpack()
{
    patches=$(ls "$pkg_dir/patches-${version}/"*.patch)
    if [ -n "$patches" ]; then
        cd "../gcc-$version" &&  cat $patches | patch -p1
    fi
}
