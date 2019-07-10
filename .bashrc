
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PATH="/Users/briansmith/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/briansmith/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/briansmith/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/briansmith/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/briansmith/perl5"; export PERL_MM_OPT;
alias config='/usr/bin/git --git-dir=/Users/briansmith/.cfg/ --work-tree=/Users/briansmith'
