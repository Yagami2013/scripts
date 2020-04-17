#/bin/bash
test(){
	echo $0;
	[ -n $1 ] && echo $1;
	[ -n $2 ] && echo $2;
	return $1;#shell count return varables,return value is only used to judge if function run success or fail
}

aa=test;
echo $aa
