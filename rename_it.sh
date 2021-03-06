#!/bin/bash

repl1=MyConponent
repl2=mycomponent

find1=BxrExtra
find2=bxrextra
path=./bxrextra

cd ..
for i in {1..10} 
do
    find $path -name \*$find2\* -a ! -name rename_it | xargs perl -e 'for(@ARGV) { $a=$_; s/'$find2'/'$repl2'/g; rename $a,$_; print "$_\n" }'
done

for i in `egrep -r $find1 $path/_build $path/core $path/assets | grep -v svn | cut -d ":" -f1`
do
    reg="s/$find1/$repl1/g"
    sed -e $reg $i > ${i}.bak
    mv ${i}.bak $i

    reg="s/$find2/$repl2/g"
    sed -e $reg $i > ${i}.bak
    mv ${i}.bak $i

    echo $i
done

