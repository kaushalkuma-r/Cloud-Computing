
#include <bits/stdc++.h>
using namespace std;

int main(){
	int n,i,process;
	int numOfVms,numOfTasks;
    cin >> numOfVms>>numOfTasks;
    // tasks - storing the expected execution time of the tasks and their order of arrival
    // vms  - storing the computational power of the corresponding virtual machine and their order of arrival
    vector<pair<int,int>> tasks,vms;
    
    for(int i=0;i<numOfTasks;i++){
        
        cout <<"Enter the requirments of the task:";
        int a;
        cin >>a ;
        tasks.push_back(make_pair(a,i+1));
    }
    for(int i=0;i<numOfVms;i++){
        cout <<"Enter the computational power of the VM :";
        int a;
        cin >>a;
        vms.push_back(make_pair(a,i+1));
    }
    // sorting the tasks and vms vector on the basis of their first element .i.e expected execution time and computational power of the VM respectively.
    sort(tasks.begin(),tasks.end());
    sort(vms.begin(),vms.end());
    
    map<int,double> vmTime;
    for(int i=0;i<numOfTasks;i++){
        // new_vm - finding out the vm where the ith task will go and taking modulus so that it does not go out of bonds
        int new_vm= i%vms.size();
        int wait=vmTime[vms[new_vm].second];
        // storing the time elapsed for the virtual machine in a hashmap
        vmTime[vms[new_vm].second]+=(double)tasks[i].first/(vms[new_vm].first);
        // cout << "Task -"<< tasks[i].second << " ||| VM -"<< vms[new_vm].second << " |||Waiting Time "<< wait << endl;
        cout << "The task "<< tasks[i].second << " will be executed at VM "<< vms[new_vm].second<< " and the time for completion will be "<< vmTime[vms[new_vm].second]<<". "<<endl;
    }
      return 0;
}