#!/bin/zsh

# zz rocket fast directory changer
# cloned, forked or at least shamelessly borrowed from https://github.com/jlauinger/zz
# licensed under GPL

alias zz=_zz
alias zzify=_zzify

ZZFILE=~/.zz
INSULT="Do you even think before you type, moron?"

zz() {
  if [[ -z $1 ]]; then
    if [[ -f $ZZFILE ]]; then
      cat $ZZFILE | awk -F "|" '{ print "\033[1m" $1 "\033[0m -> \033[95m" $2 "\033[0m" }'
    fi
  else
    if [[ -f $ZZFILE ]]; then
      HIT=`GREP_OPTIONS='' grep ^$1\| $ZZFILE 2>/dev/null | tail -n 1`
      if [[ -z $HIT ]]; then
        echo "Don't know that location, sorry..."
      else
        TARGET=`echo $HIT | awk -F "|" '{ print $2 }'`
        cd "$TARGET"
      fi
    else
      echo "Don't know that location, sorry..."
    fi
  fi
}

zzify() {
  if [[ -z $1 ]]; then
    echo $INSULT
  else
    case $1 in
      --i-fucked-up-start-over-again)
        case $2 in
          --really)
            if [[ -f $ZZFILE ]]; then
              rm $ZZFILE
            fi
            ;;
          *)
            echo "are you sure?"
            ;;
        esac
        ;;
      --delete)
        if [[ -z $2 ]]; then
          echo $INSULT
        else
          if [[ -f $ZZFILE ]]; then
            sed -i "/^$2|/d" $ZZFILE
          fi
        fi
        ;;
      *)
        if [[ $1 =~ ^-.* ]]; then
          echo "unrecognized option"
        else
          MNEMOMIC=$1
          if [[ -z $2 ]]; then
            TARGET="$PWD"
          else
            TARGET="$2"
          fi
          _zzify --delete $MNEMOMIC
          echo "$MNEMOMIC|$TARGET" >> $ZZFILE
        fi
        ;;
    esac
  fi
}
