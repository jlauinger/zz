#!/bin/zsh

# zz rocket fast directory changer
# cloned, forked or at least shamelessly borrowed from https://github.com/jlauinger/zz
# licensed under GPL

alias zz=_zz
alias zzify=_zzify

local ZZFILE=~/.zz
local INSULT="Do you even think before you type?"

zz() {
  if [[ -z $1 ]]; then
    cat $ZZFILE | awk -F "|" '{ print "\033[1m" $1 "\033[0m -> \033[95m" $2 "\033[0m" }'
  else
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
            TARGET=$PWD
          else
            TARGET=$2
          fi
          _zzify --delete $MNEMOMIC
          echo "$MNEMOMIC|$TARGET" >> $ZZFILE
        fi
        ;;
    esac
  fi
}
