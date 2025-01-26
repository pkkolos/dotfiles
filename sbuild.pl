# Set the chroot mode to schroot.
$chroot_mode = 'schroot';
$schroot = 'schroot';

# Specify the distribution; this is the same as passing `-d unstable` to sbuild.
$distribution = 'unstable';

# Build Architecture: all packages; this is the same as passing `-A` to sbuild.
$build_arch_all = 1;

# Do not run lintian after every build.
#$run_lintian = 0;

# Do not run autopkgtest after every build.
$run_autopkgtest = 0;

# Do not run piuparts after every build.
$run_piuparts = 0;

# Do not run the 'clean' target before generating the source package.
$clean_source=0;

# PGP-related option to pass to dpkg-buildpackage. Usually neither .dsc
# nor .changes files shall be signed automatically.
$pgp_options = ['-us', '-uc'];

# don't remove this, Perl needs it:
1;

