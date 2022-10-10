# Bash script to implement Max-Min ALgorithm
MaxMin(){
    # sorting the tasks and machine array .i.e expected execution time and computational power of the VM respectively.
    
    for ((i=0; i<$numOfTasks; i++))
    do
        for ((j=$i; j<$numOfTasks; j++))
        do
            if [ ${tasks[$i]} -gt ${tasks[$j]} ]
            then
                temp=${tasks[$i]}
                tasks[$i]=${tasks[$j]}
                tasks[$i]=$temp
            fi
        done
    done
    for ((i=0; i<$numOfVms; i++))
    do
        for ((j=$i; j<$numOfVms; j++))
        do
            if [ ${machine[$i]} -gt ${machine[$j]} ]
            then
                temp=${machine[$i]}
                machine[$i]=${machine[$j]}
                machine[$i]=$temp
            fi
        done
    done
   

    for((i=0;i<$numOfVms;i++))
    do
        ${time[$i]}=0
    done

    for((i=0;i<$numOfTasks;i++))

    do
        # allotedVm - finding out the vm where the ith task will go and taking modulus so that it does not go out of bound.
        allottedVm=i%numOfVms
        #index - the index of the allotted vm in the original order
        index=-1
        for ((j=1; j<$numOfVms; j++))
        do
            if [ ${machine[$allottedVm]} == ${machine_copy[$j]} ]
            then
                index=j
            fi
        done
        # storing the time elapsed for the virtual machine in an array 
        ${time[$index]}=${time[$index]}+(${tasks[$i]}/${machine[$allottedVm]})
        #index1 - the index of the allotted task in the original order
        index1=-1

        for ((j=1; j<$numOfTasks; j++))
        do
            if [ ${tasks[$allottedVm]} == ${tasks_copy[$j]} ]
            then
                index1=j
            fi
        done
        echo "The task "
        echo $index1+1
        echo " will be executed at VM "
        echo $index+1
        echo " and the time for completion will be "
        echo ${time[$index]} 
    done  
}
# tasks - storing the expected execution time of the tasks and their order of arrival
# machine - storing the computational power of the corresponding virtual machine and their order of arrival
echo -numOfTasks "Enter the number of tasks: "
read numOfTasks
for ((i=0; i<$numOfTasks; i++))
    do
    echo -numOfTasks "Enter length of the task: "
    read tasks[$i]  
    
    tasks_copy[$i]=${tasks[$i]}
    
    done
echo -numOfVms "Enter the number of Virtual Machines: "
read numOfTasks
for((i=0;i<$numOfVms;i++))
    do 
    echo -numOfVms " Enter the MIPS of VM : "
    read machine[$i]
    machine_copy[$i]=${machine[$i]}
    done
MaxMin