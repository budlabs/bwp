set -E
trap '[ "$?" -ne 77 ] || exit 77' ERR

ERM(){ >&2 echo "$*"; }
ERR(){ >&2 echo "[WARNING]" "$*"; }
ERX(){ >&2 echo "[ERROR]" "$*" && exit 77 ; }
ERH(){ >&2 printf '%s\n\n%s\n' "$_help_msg" "$*" && exit 77 ; }
