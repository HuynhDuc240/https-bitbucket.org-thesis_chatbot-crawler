#!/bin/bash
input()
{
    for((i=0;i<10000;++i))
    do
        arr[$i]=$((1 + RANDOM % 10000))
    done
}
output()
{
    echo "output:"
    for((i=0;i<10000;++i))
    do
        echo ${arr[$i]}
    done
}
shift()#$1 is left, $2 is right
{
    i=$1
    j=$((2*i+1))
    x=${arr[$i]}
    while (($j<=$2))
    do
        if(($j<$2))
        then
            t=${arr[$(($j+1))]}
            if ((arr[j] < t))
            then
            j=$((j+1))
            fi
        fi

        if ((arr[j] <= x))
        then
            return
        else
            arr[$i]=${arr[$j]}
            arr[$j]=$x
            i=$j
            j=$((2*i+1))
            x=${arr[$i]}
        fi
    done
}
CreateHeap()#$1 is the number's elements
{
    n=$1
    l=$((n/2-1))
    while((l>=0))
    do
        shift $l $((n-1))
        l=$((l-1))
    done
}
HeapSort()#$1 is the number's elements
{
    CreateHeap $1
    r=$(($1-1))
    while((r>0))
    do
        temp=${arr[0]}
        arr[0]=${a[$r]}
        arr[$r]=$temp
        r=$((r-1))
        if((r>0))
        then
            shift 0 $r
        fi
    done
}
input
SECONDS=0
HeapSort 10000
duration=$SECONDS
output
echo $duration