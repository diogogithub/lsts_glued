. "$cfg_dir_rules/$pkg/default.bash"

version=\
(
    '5.4'
)

url=\
(
    "http://archive.ubuntu.com/ubuntu/pool/universe/l/linux-raspi2/linux-raspi2_$version.0.orig.tar.gz"
)

md5=\
(
    '0707e4b2cbaf1428055d6615be04559e'
)

build_dir="linux-$version"

find_patches
