color() {
    echo "\033[0m\033[$4m\033[38:5:$2m\033[48:5:$3m $1 \033[0m"
}

#STATUS      COLOR     BACKGROUND     TEXT

echo
color NORMAL         00        02             1
color NORMAL-SHELLS  15        02             1
color ESCAPE         00        15             1
echo
color INSERT         15        01             1
color COPY           00        04             1
echo
color VISUAL         00        03             1
echo
color REPLACE        15        05             1
color REPLACE-SHELLS 00        05             1
echo
echo
color username       255        239           0
color hostname       255        236           0
color directory      00         04            0
color git            00         03            0
color jobs           00         06            0
echo
color exit-fail      15         01             0
color exit-issue     00         03             0
color exit-success   00         02             0
echo
echo

