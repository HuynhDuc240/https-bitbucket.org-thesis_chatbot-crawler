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
quicksort()#$1 is left, $2 is right
{
    left=$1
    right=$2
    mid=${arr[$((($1+$2)/2))]}
    i=$left
    j=$right
    while (($i<$j))
    do 
       
         while((${arr[$i]} < $mid))
         do
            i=$(($i+1))   
         done

         while((${arr[$j]} > $mid))
         do
            j=$(($j-1)) 
         done

         if(($i <= $j))
         then
            temp=${arr[$i]}
            arr[$i]=${arr[$j]}
            arr[$j]=$temp
            i=$(($i+1))
            j=$(($j-1)) 
         fi
    done
    if(($1 < $j))
    then
        quicksort $1 $j 
    fi

    if(($i < $2))
    then
        quicksort $i $2 
    fi

}
input
SECONDS=0
quicksort 0 9999
duration=$SECONDS 
output
echo $duration
