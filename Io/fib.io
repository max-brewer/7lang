
i := 0
to := System args at(0)
to println
if(to == nil, "no argument provided" println; exit)
fibs := list()
next := method(if(fibs size < 2, 1, fibs at(i -1) +fibs at(i-2)))

while(fibs size < to,
	fibs append next();
	fibs at(i) println;
	i = i+1;
)
