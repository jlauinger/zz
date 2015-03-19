#!/bin/zsh

# zz rocket fast directory changer
# cloned, forked or at least shamelessly borrowed from https://github.com/jlauinger/zz
# licensed under GPL

alias zz=_zz
alias zzify=_zzify

local ZZFILE='~/.zz'
local INSULT='Do you even think before you type?'

zz() {
  echo not implemented yet, go away
}

zzify() {
  if [[ -z $1 ]]; then
    echo $INSULT
  else
    case $1 in
      --delete)
        if [[ -z $2 ]]; then
          echo $INSULT
        else
          if [[ -f $ZZFILE ]]; then
            sed -i "/^$2|/d" $ZZFILE
          fi
        fi
        ;;
      --i-fucked-up-start-over-again)
        case $2 in
          --really)
            if [[ -f $ZZFILE ]]; then
              rm $ZZFILE
              echo "and it's gone..."
            fi
            ;;
          *)
            echo "are you sure?"
            ;;
        esac
        ;;
      *)
        MNEMOMIC=$1
        if [[ -z $2 ]]; then
          TARGET=$PWD
        else
          TARGET=$2
        fi
        echo $TARGET
        ;;
    esac
  fi
}
