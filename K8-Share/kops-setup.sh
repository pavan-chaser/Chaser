[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ export CLUSTER_NAME=kops.etechbrain.com
[ec2-user@ip-12-0-15-146 ~]$ export KOPS_STATE_STORE=s3://clusters.kubernetes.etechbran.com
[ec2-user@ip-12-0-15-146 ~]$ export SSH_PUBLIC_KEY=/home/ec2-user/.ssh/id_rsa.pub
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ vi cluster.yml
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ kops replace --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE} --filename ./cluster.yml --force
I1231 08:56:30.355542   23830 replace.go:179] instanceGroup: master-ap-south-1a was not found, creating resource now
I1231 08:56:30.394370   23830 replace.go:179] instanceGroup: master-ap-south-1b was not found, creating resource now
I1231 08:56:30.429888   23830 replace.go:179] instanceGroup: master-ap-south-1c was not found, creating resource now
I1231 08:56:30.502156   23830 replace.go:179] instanceGroup: nodes-ap-south-1a was not found, creating resource now
I1231 08:56:30.536942   23830 replace.go:179] instanceGroup: nodes-ap-south-1b was not found, creating resource now
I1231 08:56:30.589047   23830 replace.go:179] instanceGroup: nodes-ap-south-1c was not found, creating resource now
[ec2-user@ip-12-0-15-146 ~]$ ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/ec2-user/.ssh/id_rsa.
Your public key has been saved in /home/ec2-user/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:Qa/of/5rmL0gl1nx0pqi2XO/5AXp+aSyu2I8qp8GbTM ec2-user@ip-12-0-15-146
The key's randomart image is:
+---[RSA 2048]----+
|        .        |
|       . .       |
|        . . .    |
|       . o   + . |
|      ..S   o =  |
|     .. E  + = o |
|      .o.+*+o + o|
|       ..BXo=o = |
|      .+B=oBBO=..|
+----[SHA256]-----+
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ kops create secret sshpublickey admin --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE} --pubkey ${SSH_PUBLIC_KEY}
[ec2-user@ip-12-0-15-146 ~]$ kops update cluster --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE}
I1231 08:56:51.428103   23841 subnets.go:184] Assigned CIDR 172.22.32.0/19 to subnet ap-south-1a
I1231 08:56:51.428202   23841 subnets.go:184] Assigned CIDR 172.22.64.0/19 to subnet ap-south-1b
I1231 08:56:51.428258   23841 subnets.go:184] Assigned CIDR 172.22.96.0/19 to subnet ap-south-1c
I1231 08:56:51.428316   23841 subnets.go:198] Assigned CIDR 172.22.0.0/22 to subnet utility-ap-south-1a
I1231 08:56:51.428367   23841 subnets.go:198] Assigned CIDR 172.22.4.0/22 to subnet utility-ap-south-1b
I1231 08:56:51.428431   23841 subnets.go:198] Assigned CIDR 172.22.8.0/22 to subnet utility-ap-south-1c

*********************************************************************************

A new kubernetes version is available: 1.11.10
Upgrading is recommended (try kops upgrade cluster)

More information: https://github.com/kubernetes/kops/blob/master/permalinks/upgrade_k8s.md#1.11.10

*********************************************************************************


*********************************************************************************

Kubelet anonymousAuth is currently turned on. This allows RBAC escalation and remote code execution possibilities.
It is highly recommended you turn it off by setting 'spec.kubelet.anonymousAuth' to 'false' via 'kops edit cluster'

See https://github.com/kubernetes/kops/blob/master/docs/security.md#kubelet-api

*********************************************************************************

I1231 08:56:52.198392   23841 context.go:249] hit maximum retries 1 with error file does not exist
I1231 08:56:52.802910   23841 context.go:249] hit maximum retries 1 with error file does not exist
W1231 08:56:54.934653   23841 firewall.go:250] Opening etcd port on masters for access from the nodes, for calico.  This is unsafe in untrusted environments.
I1231 08:56:54.938803   23841 executor.go:103] Tasks: 0 done / 104 total; 42 can run
I1231 08:56:55.761576   23841 executor.go:103] Tasks: 42 done / 104 total; 29 can run
W1231 08:56:56.194136   23841 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.194266   23841 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.194333   23841 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.194396   23841 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.194473   23841 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.194527   23841 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 08:56:56.194628   23841 executor.go:103] Tasks: 65 done / 104 total; 28 can run
W1231 08:56:56.300163   23841 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.300287   23841 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.300624   23841 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.300689   23841 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.300745   23841 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.300786   23841 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 08:56:56.300864   23841 executor.go:103] Tasks: 87 done / 104 total; 6 can run
W1231 08:56:56.356658   23841 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.356731   23841 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.356793   23841 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.356838   23841 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.356875   23841 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:56:56.356914   23841 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 08:56:56.356966   23841 executor.go:145] No progress made, sleeping before retrying 6 failed task(s)
I1231 08:57:06.357243   23841 executor.go:103] Tasks: 87 done / 104 total; 6 can run
W1231 08:57:06.407989   23841 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:57:06.408112   23841 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:57:06.408185   23841 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:57:06.408239   23841 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:57:06.408297   23841 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 08:57:06.408336   23841 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 08:57:06.408372   23841 executor.go:145] No progress made, sleeping before retrying 6 failed task(s)
^C
[ec2-user@ip-12-0-15-146 ~]$ kubectl -v
Error: flag needs an argument: 'v' in -v
See 'kubectl --help' for usage.
[ec2-user@ip-12-0-15-146 ~]$ kubectl --version
Error: unknown flag: --version
See 'kubectl --help' for usage.
[ec2-user@ip-12-0-15-146 ~]$ kubectl version
Client Version: version.Info{Major:"1", Minor:"17", GitVersion:"v1.17.0", GitCommit:"70132b0f130acc0bed193d9ba59dd186f0e634cf", GitTreeState:"clean", BuildDate:"2019-12-07T21:20:10Z", GoVersion:"go1.13.4", Compiler:"gc", Platform:"linux/amd64"}
The connection to the server localhost:8080 was refused - did you specify the right host or port?
[ec2-user@ip-12-0-15-146 ~]$ vi cluster.yml
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ vi cluster.yml
[ec2-user@ip-12-0-15-146 ~]$ kops update cluster --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE}
I1231 09:02:25.325572   23875 subnets.go:184] Assigned CIDR 172.22.32.0/19 to subnet ap-south-1a
I1231 09:02:25.325691   23875 subnets.go:184] Assigned CIDR 172.22.64.0/19 to subnet ap-south-1b
I1231 09:02:25.325729   23875 subnets.go:184] Assigned CIDR 172.22.96.0/19 to subnet ap-south-1c
I1231 09:02:25.325798   23875 subnets.go:198] Assigned CIDR 172.22.0.0/22 to subnet utility-ap-south-1a
I1231 09:02:25.325860   23875 subnets.go:198] Assigned CIDR 172.22.4.0/22 to subnet utility-ap-south-1b
I1231 09:02:25.325913   23875 subnets.go:198] Assigned CIDR 172.22.8.0/22 to subnet utility-ap-south-1c

*********************************************************************************

A new kubernetes version is available: 1.11.10
Upgrading is recommended (try kops upgrade cluster)

More information: https://github.com/kubernetes/kops/blob/master/permalinks/upgrade_k8s.md#1.11.10

*********************************************************************************


*********************************************************************************

Kubelet anonymousAuth is currently turned on. This allows RBAC escalation and remote code execution possibilities.
It is highly recommended you turn it off by setting 'spec.kubelet.anonymousAuth' to 'false' via 'kops edit cluster'

See https://github.com/kubernetes/kops/blob/master/docs/security.md#kubelet-api

*********************************************************************************

I1231 09:02:26.099748   23875 context.go:249] hit maximum retries 1 with error file does not exist
I1231 09:02:26.702400   23875 context.go:249] hit maximum retries 1 with error file does not exist
W1231 09:02:28.828014   23875 firewall.go:250] Opening etcd port on masters for access from the nodes, for calico.  This is unsafe in untrusted environments.
I1231 09:02:28.831260   23875 executor.go:103] Tasks: 0 done / 104 total; 42 can run
I1231 09:02:29.917432   23875 executor.go:103] Tasks: 42 done / 104 total; 29 can run
W1231 09:02:30.513568   23875 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.513696   23875 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.513764   23875 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.513818   23875 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.513874   23875 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.513925   23875 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 09:02:30.514030   23875 executor.go:103] Tasks: 65 done / 104 total; 28 can run
W1231 09:02:30.657714   23875 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.657836   23875 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.657925   23875 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.658009   23875 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.658060   23875 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.658101   23875 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 09:02:30.658191   23875 executor.go:103] Tasks: 87 done / 104 total; 6 can run
W1231 09:02:30.712161   23875 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.712272   23875 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.712341   23875 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.712409   23875 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.712466   23875 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:30.712518   23875 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m59s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 09:02:30.712569   23875 executor.go:145] No progress made, sleeping before retrying 6 failed task(s)
I1231 09:02:40.712843   23875 executor.go:103] Tasks: 87 done / 104 total; 6 can run
W1231 09:02:40.764017   23875 executor.go:130] error running task "Subnet/utility-ap-south-1c.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:40.764119   23875 executor.go:130] error running task "Subnet/utility-ap-south-1a.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:40.764199   23875 executor.go:130] error running task "Subnet/utility-ap-south-1b.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:40.764247   23875 executor.go:130] error running task "Subnet/ap-south-1b.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:40.764305   23875 executor.go:130] error running task "Subnet/ap-south-1a.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
W1231 09:02:40.764345   23875 executor.go:130] error running task "Subnet/ap-south-1c.kops.etechbrain.com" (9m49s remaining to succeed): Subnet.VPC: Invalid value: "null": field is immutable: old="vpc-0880266a5ef404663" new="null"
I1231 09:02:40.764380   23875 executor.go:145] No progress made, sleeping before retrying 6 failed task(s)
^C
[ec2-user@ip-12-0-15-146 ~]$
login as: ec2-user
Pre-authentication banner message from server:
| Authorized uses only. All activity may be monitored and reported.
End of banner message from server
Authenticating with public key "imported-openssh-key"
Last login: Tue Dec 31 08:52:22 2019 from 103.125.160.12

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2018.03-release-notes/
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ export CLUSTER_NAME=kops.etechbrain.com
[ec2-user@ip-12-0-15-146 ~]$ export KOPS_STATE_STORE=s3://clusters.kubernetes.etechbran.com
[ec2-user@ip-12-0-15-146 ~]$ export SSH_PUBLIC_KEY=/home/ec2-user/.ssh/id_rsa.pub
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ kops replace --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE} --filename ./cluster.yml --force
[ec2-user@ip-12-0-15-146 ~]$ kops create secret sshpublickey admin --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE} --pubkey ${SSH_PUBLIC_KEY}
[ec2-user@ip-12-0-15-146 ~]$ kops update cluster --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE}

*********************************************************************************

A new kubernetes version is available: 1.13.12
Upgrading is recommended (try kops upgrade cluster)

More information: https://github.com/kubernetes/kops/blob/master/permalinks/upgrade_k8s.md#1.13.12

*********************************************************************************


*********************************************************************************

Kubelet anonymousAuth is currently turned on. This allows RBAC escalation and remote code execution possibilities.
It is highly recommended you turn it off by setting 'spec.kubelet.anonymousAuth' to 'false' via 'kops edit cluster'

See https://github.com/kubernetes/kops/blob/master/docs/security.md#kubelet-api

*********************************************************************************

I1231 09:08:59.402506   23917 context.go:249] hit maximum retries 1 with error file does not exist
I1231 09:09:00.800830   23917 context.go:249] hit maximum retries 1 with error file does not exist
W1231 09:09:04.177269   23917 firewall.go:250] Opening etcd port on masters for access from the nodes, for calico.  This is unsafe in untrusted environments.
I1231 09:09:04.182273   23917 executor.go:103] Tasks: 0 done / 111 total; 50 can run
I1231 09:09:05.008587   23917 executor.go:103] Tasks: 50 done / 111 total; 28 can run
I1231 09:09:05.413384   23917 executor.go:103] Tasks: 78 done / 111 total; 23 can run
I1231 09:09:05.513642   23917 executor.go:103] Tasks: 101 done / 111 total; 7 can run
I1231 09:09:05.720407   23917 executor.go:103] Tasks: 108 done / 111 total; 3 can run
I1231 09:09:05.809576   23917 executor.go:103] Tasks: 111 done / 111 total; 0 can run
Will create resources:
  AutoscalingGroup/master-ap-south-1a.masters.kops.etechbrain.com
        Granularity             1Minute
        LaunchConfiguration     name:master-ap-south-1a.masters.kops.etechbrain.com
        MaxSize                 1
        Metrics                 [GroupDesiredCapacity, GroupInServiceInstances, GroupMaxSize, GroupMinSize, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances]
        MinSize                 1
        Subnets                 [name:ap-south-1a.kops.etechbrain.com id:subnet-0bf8aeecca5959e73]
        SuspendProcesses        []
        Tags                    {k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup: master-ap-south-1a, k8s.io/role/master: 1, kops.k8s.io/instancegroup: master-ap-south-1a, Name: master-ap-south-1a.masters.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com}

  AutoscalingGroup/master-ap-south-1b.masters.kops.etechbrain.com
        Granularity             1Minute
        LaunchConfiguration     name:master-ap-south-1b.masters.kops.etechbrain.com
        MaxSize                 1
        Metrics                 [GroupDesiredCapacity, GroupInServiceInstances, GroupMaxSize, GroupMinSize, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances]
        MinSize                 1
        Subnets                 [name:ap-south-1b.kops.etechbrain.com id:subnet-0aaecdd50460cfe88]
        SuspendProcesses        []
        Tags                    {k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup: master-ap-south-1b, k8s.io/role/master: 1, kops.k8s.io/instancegroup: master-ap-south-1b, Name: master-ap-south-1b.masters.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com}

  AutoscalingGroup/master-ap-south-1c.masters.kops.etechbrain.com
        Granularity             1Minute
        LaunchConfiguration     name:master-ap-south-1c.masters.kops.etechbrain.com
        MaxSize                 1
        Metrics                 [GroupDesiredCapacity, GroupInServiceInstances, GroupMaxSize, GroupMinSize, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances]
        MinSize                 1
        Subnets                 [name:ap-south-1c.kops.etechbrain.com id:subnet-06a742ed619b27aa0]
        SuspendProcesses        []
        Tags                    {Name: master-ap-south-1c.masters.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup: master-ap-south-1c, k8s.io/role/master: 1, kops.k8s.io/instancegroup: master-ap-south-1c}

  AutoscalingGroup/nodes-ap-south-1a.kops.etechbrain.com
        Granularity             1Minute
        LaunchConfiguration     name:nodes-ap-south-1a.kops.etechbrain.com
        MaxSize                 5
        Metrics                 [GroupDesiredCapacity, GroupInServiceInstances, GroupMaxSize, GroupMinSize, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances]
        MinSize                 1
        Subnets                 [name:ap-south-1a.kops.etechbrain.com id:subnet-0bf8aeecca5959e73]
        SuspendProcesses        []
        Tags                    {kops.k8s.io/instancegroup: nodes-ap-south-1a, Name: nodes-ap-south-1a.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, kubernetes.io/cluster/kops.etechbrain.com: true, k8s.io/cluster-autoscaler/enabled: true, k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup: nodes-ap-south-1a, k8s.io/role/node: 1}

  AutoscalingGroup/nodes-ap-south-1b.kops.etechbrain.com
        Granularity             1Minute
        LaunchConfiguration     name:nodes-ap-south-1b.kops.etechbrain.com
        MaxSize                 5
        Metrics                 [GroupDesiredCapacity, GroupInServiceInstances, GroupMaxSize, GroupMinSize, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances]
        MinSize                 1
        Subnets                 [name:ap-south-1b.kops.etechbrain.com id:subnet-0aaecdd50460cfe88]
        SuspendProcesses        []
        Tags                    {Name: nodes-ap-south-1b.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, k8s.io/cluster-autoscaler/enabled: true, kubernetes.io/cluster/kops.etechbrain.com: true, k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup: nodes-ap-south-1b, k8s.io/role/node: 1, kops.k8s.io/instancegroup: nodes-ap-south-1b}

  AutoscalingGroup/nodes-ap-south-1c.kops.etechbrain.com
        Granularity             1Minute
        LaunchConfiguration     name:nodes-ap-south-1c.kops.etechbrain.com
        MaxSize                 5
        Metrics                 [GroupDesiredCapacity, GroupInServiceInstances, GroupMaxSize, GroupMinSize, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances]
        MinSize                 1
        Subnets                 [name:ap-south-1c.kops.etechbrain.com id:subnet-06a742ed619b27aa0]
        SuspendProcesses        []
        Tags                    {k8s.io/cluster-autoscaler/enabled: true, kubernetes.io/cluster/kops.etechbrain.com: true, k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup: nodes-ap-south-1c, k8s.io/role/node: 1, kops.k8s.io/instancegroup: nodes-ap-south-1c, Name: nodes-ap-south-1c.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com}

  DNSName/api.kops.etechbrain.com
        Zone                    name:kops.etechbrain.com id:kops.etechbrain.com
        ResourceType            A
        TargetLoadBalancer      name:api.kops.etechbrain.com id:api.kops.etechbrain.com

  EBSVolume/a.etcd-events.kops.etechbrain.com
        AvailabilityZone        ap-south-1a
        Encrypted               false
        SizeGB                  20
        Tags                    {k8s.io/role/master: 1, kubernetes.io/cluster/kops.etechbrain.com: owned, Name: a.etcd-events.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, k8s.io/etcd/events: a/a,b,c}
        VolumeType              gp2

  EBSVolume/a.etcd-main.kops.etechbrain.com
        AvailabilityZone        ap-south-1a
        Encrypted               false
        SizeGB                  20
        Tags                    {k8s.io/etcd/main: a/a,b,c, k8s.io/role/master: 1, kubernetes.io/cluster/kops.etechbrain.com: owned, Name: a.etcd-main.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com}
        VolumeType              gp2

  EBSVolume/b.etcd-events.kops.etechbrain.com
        AvailabilityZone        ap-south-1b
        Encrypted               false
        SizeGB                  20
        Tags                    {KubernetesCluster: kops.etechbrain.com, k8s.io/etcd/events: b/a,b,c, k8s.io/role/master: 1, kubernetes.io/cluster/kops.etechbrain.com: owned, Name: b.etcd-events.kops.etechbrain.com}
        VolumeType              gp2

  EBSVolume/b.etcd-main.kops.etechbrain.com
        AvailabilityZone        ap-south-1b
        Encrypted               false
        SizeGB                  20
        Tags                    {k8s.io/etcd/main: b/a,b,c, k8s.io/role/master: 1, kubernetes.io/cluster/kops.etechbrain.com: owned, Name: b.etcd-main.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com}
        VolumeType              gp2

  EBSVolume/c.etcd-events.kops.etechbrain.com
        AvailabilityZone        ap-south-1c
        Encrypted               false
        SizeGB                  20
        Tags                    {k8s.io/etcd/events: c/a,b,c, k8s.io/role/master: 1, kubernetes.io/cluster/kops.etechbrain.com: owned, Name: c.etcd-events.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com}
        VolumeType              gp2

  EBSVolume/c.etcd-main.kops.etechbrain.com
        AvailabilityZone        ap-south-1c
        Encrypted               false
        SizeGB                  20
        Tags                    {Name: c.etcd-main.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, k8s.io/etcd/main: c/a,b,c, k8s.io/role/master: 1, kubernetes.io/cluster/kops.etechbrain.com: owned}
        VolumeType              gp2

  IAMInstanceProfile/masters.kops.etechbrain.com
        Shared                  false

  IAMInstanceProfile/nodes.kops.etechbrain.com
        Shared                  false

  IAMInstanceProfileRole/masters.kops.etechbrain.com
        InstanceProfile         name:masters.kops.etechbrain.com id:masters.kops.etechbrain.com
        Role                    name:masters.kops.etechbrain.com

  IAMInstanceProfileRole/nodes.kops.etechbrain.com
        InstanceProfile         name:nodes.kops.etechbrain.com id:nodes.kops.etechbrain.com
        Role                    name:nodes.kops.etechbrain.com

  IAMRole/masters.kops.etechbrain.com
        ExportWithID            masters

  IAMRole/nodes.kops.etechbrain.com
        ExportWithID            nodes

  IAMRolePolicy/additional.nodes.kops.etechbrain.com
        Role                    name:nodes.kops.etechbrain.com

  IAMRolePolicy/masters.kops.etechbrain.com
        Role                    name:masters.kops.etechbrain.com

  IAMRolePolicy/nodes.kops.etechbrain.com
        Role                    name:nodes.kops.etechbrain.com

  Keypair/apiserver-aggregator
        Signer                  name:apiserver-aggregator-ca id:cn=apiserver-aggregator-ca
        Subject                 cn=aggregator
        Type                    client
        Format                  v1alpha2

  Keypair/apiserver-aggregator-ca
        Subject                 cn=apiserver-aggregator-ca
        Type                    ca
        Format                  v1alpha2

  Keypair/apiserver-proxy-client
        Signer                  name:ca id:cn=kubernetes
        Subject                 cn=apiserver-proxy-client
        Type                    client
        Format                  v1alpha2

  Keypair/ca
        Subject                 cn=kubernetes
        Type                    ca
        Format                  v1alpha2

  Keypair/etcd-clients-ca
        Subject                 cn=etcd-clients-ca
        Type                    ca
        Format                  v1alpha2

  Keypair/etcd-manager-ca-events
        Subject                 cn=etcd-manager-ca-events
        Type                    ca
        Format                  v1alpha2

  Keypair/etcd-manager-ca-main
        Subject                 cn=etcd-manager-ca-main
        Type                    ca
        Format                  v1alpha2

  Keypair/etcd-peers-ca-events
        Subject                 cn=etcd-peers-ca-events
        Type                    ca
        Format                  v1alpha2

  Keypair/etcd-peers-ca-main
        Subject                 cn=etcd-peers-ca-main
        Type                    ca
        Format                  v1alpha2

  Keypair/kops
        Signer                  name:ca id:cn=kubernetes
        Subject                 o=system:masters,cn=kops
        Type                    client
        Format                  v1alpha2

  Keypair/kube-controller-manager
        Signer                  name:ca id:cn=kubernetes
        Subject                 cn=system:kube-controller-manager
        Type                    client
        Format                  v1alpha2

  Keypair/kube-proxy
        Signer                  name:ca id:cn=kubernetes
        Subject                 cn=system:kube-proxy
        Type                    client
        Format                  v1alpha2

  Keypair/kube-scheduler
        Signer                  name:ca id:cn=kubernetes
        Subject                 cn=system:kube-scheduler
        Type                    client
        Format                  v1alpha2

  Keypair/kubecfg
        Signer                  name:ca id:cn=kubernetes
        Subject                 o=system:masters,cn=kubecfg
        Type                    client
        Format                  v1alpha2

  Keypair/kubelet
        Signer                  name:ca id:cn=kubernetes
        Subject                 o=system:nodes,cn=kubelet
        Type                    client
        Format                  v1alpha2

  Keypair/kubelet-api
        Signer                  name:ca id:cn=kubernetes
        Subject                 cn=kubelet-api
        Type                    client
        Format                  v1alpha2

  Keypair/master
        AlternateNames          [100.64.0.1, 127.0.0.1, api.internal.kops.etechbrain.com, api.kops.etechbrain.com, kubernetes, kubernetes.default, kubernetes.default.svc, kubernetes.default.svc.cluster.local]
        Signer                  name:ca id:cn=kubernetes
        Subject                 cn=kubernetes-master
        Type                    server
        Format                  v1alpha2

  LaunchConfiguration/master-ap-south-1a.masters.kops.etechbrain.com
        AssociatePublicIP       false
        IAMInstanceProfile      name:masters.kops.etechbrain.com id:masters.kops.etechbrain.com
        ImageID                 kope.io/k8s-1.11-debian-stretch-amd64-hvm-ebs-2018-08-17
        InstanceType            m5.large
        RootVolumeSize          64
        RootVolumeType          gp2
        SSHKey                  name:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90 id:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
        SecurityGroups          [name:masters.kops.etechbrain.com]
        SpotPrice

  LaunchConfiguration/master-ap-south-1b.masters.kops.etechbrain.com
        AssociatePublicIP       false
        IAMInstanceProfile      name:masters.kops.etechbrain.com id:masters.kops.etechbrain.com
        ImageID                 kope.io/k8s-1.11-debian-stretch-amd64-hvm-ebs-2018-08-17
        InstanceType            m5.large
        RootVolumeSize          64
        RootVolumeType          gp2
        SSHKey                  name:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90 id:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
        SecurityGroups          [name:masters.kops.etechbrain.com]
        SpotPrice

  LaunchConfiguration/master-ap-south-1c.masters.kops.etechbrain.com
        AssociatePublicIP       false
        IAMInstanceProfile      name:masters.kops.etechbrain.com id:masters.kops.etechbrain.com
        ImageID                 kope.io/k8s-1.11-debian-stretch-amd64-hvm-ebs-2018-08-17
        InstanceType            m5.large
        RootVolumeSize          64
        RootVolumeType          gp2
        SSHKey                  name:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90 id:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
        SecurityGroups          [name:masters.kops.etechbrain.com]
        SpotPrice

  LaunchConfiguration/nodes-ap-south-1a.kops.etechbrain.com
        AssociatePublicIP       false
        IAMInstanceProfile      name:nodes.kops.etechbrain.com id:nodes.kops.etechbrain.com
        ImageID                 kope.io/k8s-1.11-debian-stretch-amd64-hvm-ebs-2018-08-17
        InstanceType            m5.xlarge
        RootVolumeSize          128
        RootVolumeType          gp2
        SSHKey                  name:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90 id:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
        SecurityGroups          [name:nodes.kops.etechbrain.com]
        SpotPrice               0.22

  LaunchConfiguration/nodes-ap-south-1b.kops.etechbrain.com
        AssociatePublicIP       false
        IAMInstanceProfile      name:nodes.kops.etechbrain.com id:nodes.kops.etechbrain.com
        ImageID                 kope.io/k8s-1.11-debian-stretch-amd64-hvm-ebs-2018-08-17
        InstanceType            m5.xlarge
        RootVolumeSize          128
        RootVolumeType          gp2
        SSHKey                  name:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90 id:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
        SecurityGroups          [name:nodes.kops.etechbrain.com]
        SpotPrice               0.22

  LaunchConfiguration/nodes-ap-south-1c.kops.etechbrain.com
        AssociatePublicIP       false
        IAMInstanceProfile      name:nodes.kops.etechbrain.com id:nodes.kops.etechbrain.com
        ImageID                 kope.io/k8s-1.11-debian-stretch-amd64-hvm-ebs-2018-08-17
        InstanceType            m5.xlarge
        RootVolumeSize          128
        RootVolumeType          gp2
        SSHKey                  name:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90 id:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
        SecurityGroups          [name:nodes.kops.etechbrain.com]
        SpotPrice               0.22

  LoadBalancer/api.kops.etechbrain.com
        LoadBalancerName        api-kops-etechbrain-com-iuuvt2
        Subnets                 [name:ap-south-1c.kops.etechbrain.com id:subnet-06a742ed619b27aa0, name:ap-south-1b.kops.etechbrain.com id:subnet-0aaecdd50460cfe88, name:ap-south-1a.kops.etechbrain.com id:subnet-0bf8aeecca5959e73]
        SecurityGroups          [name:api-elb.kops.etechbrain.com]
        Listeners               {443: {"InstancePort":443,"SSLCertificateID":""}}
        Scheme                  internal
        HealthCheck             {"Target":"SSL:443","HealthyThreshold":2,"UnhealthyThreshold":2,"Interval":10,"Timeout":5}
        ConnectionSettings      {"IdleTimeout":300}
        CrossZoneLoadBalancing  {"Enabled":false}
        SSLCertificateID
        Tags                    {Name: api.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, kubernetes.io/cluster/kops.etechbrain.com: owned}

  LoadBalancerAttachment/api-master-ap-south-1a
        LoadBalancer            name:api.kops.etechbrain.com id:api.kops.etechbrain.com
        AutoscalingGroup        name:master-ap-south-1a.masters.kops.etechbrain.com id:master-ap-south-1a.masters.kops.etechbrain.com

  LoadBalancerAttachment/api-master-ap-south-1b
        LoadBalancer            name:api.kops.etechbrain.com id:api.kops.etechbrain.com
        AutoscalingGroup        name:master-ap-south-1b.masters.kops.etechbrain.com id:master-ap-south-1b.masters.kops.etechbrain.com

  LoadBalancerAttachment/api-master-ap-south-1c
        LoadBalancer            name:api.kops.etechbrain.com id:api.kops.etechbrain.com
        AutoscalingGroup        name:master-ap-south-1c.masters.kops.etechbrain.com id:master-ap-south-1c.masters.kops.etechbrain.com

  ManagedFile/etcd-cluster-spec-events
        Location                backups/etcd/events/control/etcd-cluster-spec

  ManagedFile/etcd-cluster-spec-main
        Location                backups/etcd/main/control/etcd-cluster-spec

  ManagedFile/kops.etechbrain.com-addons-bootstrap
        Location                addons/bootstrap-channel.yaml

  ManagedFile/kops.etechbrain.com-addons-core.addons.k8s.io
        Location                addons/core.addons.k8s.io/v1.4.0.yaml

  ManagedFile/kops.etechbrain.com-addons-coredns.addons.k8s.io-k8s-1.12
        Location                addons/coredns.addons.k8s.io/k8s-1.12.yaml

  ManagedFile/kops.etechbrain.com-addons-coredns.addons.k8s.io-k8s-1.6
        Location                addons/coredns.addons.k8s.io/k8s-1.6.yaml

  ManagedFile/kops.etechbrain.com-addons-dns-controller.addons.k8s.io-k8s-1.12
        Location                addons/dns-controller.addons.k8s.io/k8s-1.12.yaml

  ManagedFile/kops.etechbrain.com-addons-dns-controller.addons.k8s.io-k8s-1.6
        Location                addons/dns-controller.addons.k8s.io/k8s-1.6.yaml

  ManagedFile/kops.etechbrain.com-addons-dns-controller.addons.k8s.io-pre-k8s-1.6
        Location                addons/dns-controller.addons.k8s.io/pre-k8s-1.6.yaml

  ManagedFile/kops.etechbrain.com-addons-kubelet-api.rbac.addons.k8s.io-k8s-1.9
        Location                addons/kubelet-api.rbac.addons.k8s.io/k8s-1.9.yaml

  ManagedFile/kops.etechbrain.com-addons-limit-range.addons.k8s.io
        Location                addons/limit-range.addons.k8s.io/v1.5.0.yaml

  ManagedFile/kops.etechbrain.com-addons-networking.projectcalico.org-k8s-1.12
        Location                addons/networking.projectcalico.org/k8s-1.12.yaml

  ManagedFile/kops.etechbrain.com-addons-networking.projectcalico.org-k8s-1.6
        Location                addons/networking.projectcalico.org/k8s-1.6.yaml

  ManagedFile/kops.etechbrain.com-addons-networking.projectcalico.org-k8s-1.7
        Location                addons/networking.projectcalico.org/k8s-1.7.yaml

  ManagedFile/kops.etechbrain.com-addons-networking.projectcalico.org-pre-k8s-1.6
        Location                addons/networking.projectcalico.org/pre-k8s-1.6.yaml

  ManagedFile/kops.etechbrain.com-addons-rbac.addons.k8s.io-k8s-1.8
        Location                addons/rbac.addons.k8s.io/k8s-1.8.yaml

  ManagedFile/kops.etechbrain.com-addons-storage-aws.addons.k8s.io-v1.15.0
        Location                addons/storage-aws.addons.k8s.io/v1.15.0.yaml

  ManagedFile/kops.etechbrain.com-addons-storage-aws.addons.k8s.io-v1.6.0
        Location                addons/storage-aws.addons.k8s.io/v1.6.0.yaml

  ManagedFile/kops.etechbrain.com-addons-storage-aws.addons.k8s.io-v1.7.0
        Location                addons/storage-aws.addons.k8s.io/v1.7.0.yaml

  ManagedFile/manifests-etcdmanager-events
        Location                manifests/etcd/events.yaml

  ManagedFile/manifests-etcdmanager-main
        Location                manifests/etcd/main.yaml

  SSHKey/kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
        KeyFingerprint          70:26:ac:be:5f:d8:ea:0b:e2:87:29:e6:d0:1a:b6:5b

  Secret/admin

  Secret/kube

  Secret/kube-proxy

  Secret/kubelet

  Secret/system:controller_manager

  Secret/system:dns

  Secret/system:logging

  Secret/system:monitoring

  Secret/system:scheduler

  SecurityGroup/api-elb.kops.etechbrain.com
        Description             Security group for api ELB
        VPC                     name:kops.etechbrain.com id:vpc-0880266a5ef404663
        RemoveExtraRules        [port=443]
        Tags                    {Name: api-elb.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, kubernetes.io/cluster/kops.etechbrain.com: owned}

  SecurityGroup/masters.kops.etechbrain.com
        Description             Security group for masters
        VPC                     name:kops.etechbrain.com id:vpc-0880266a5ef404663
        RemoveExtraRules        [port=22, port=443, port=2380, port=2381, port=4001, port=4002, port=4789, port=179]
        Tags                    {kubernetes.io/cluster/kops.etechbrain.com: owned, Name: masters.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com}

  SecurityGroup/nodes.kops.etechbrain.com
        Description             Security group for nodes
        VPC                     name:kops.etechbrain.com id:vpc-0880266a5ef404663
        RemoveExtraRules        [port=22]
        Tags                    {Name: nodes.kops.etechbrain.com, KubernetesCluster: kops.etechbrain.com, kubernetes.io/cluster/kops.etechbrain.com: owned}

  SecurityGroupRule/all-master-to-master
        SecurityGroup           name:masters.kops.etechbrain.com
        SourceGroup             name:masters.kops.etechbrain.com

  SecurityGroupRule/all-master-to-node
        SecurityGroup           name:nodes.kops.etechbrain.com
        SourceGroup             name:masters.kops.etechbrain.com

  SecurityGroupRule/all-node-to-node
        SecurityGroup           name:nodes.kops.etechbrain.com
        SourceGroup             name:nodes.kops.etechbrain.com

  SecurityGroupRule/api-elb-egress
        SecurityGroup           name:api-elb.kops.etechbrain.com
        CIDR                    0.0.0.0/0
        Egress                  true

  SecurityGroupRule/https-api-elb-0.0.0.0/0
        SecurityGroup           name:api-elb.kops.etechbrain.com
        CIDR                    0.0.0.0/0
        Protocol                tcp
        FromPort                443
        ToPort                  443

  SecurityGroupRule/https-elb-to-master
        SecurityGroup           name:masters.kops.etechbrain.com
        Protocol                tcp
        FromPort                443
        ToPort                  443
        SourceGroup             name:api-elb.kops.etechbrain.com

  SecurityGroupRule/icmp-pmtu-api-elb-0.0.0.0/0
        SecurityGroup           name:api-elb.kops.etechbrain.com
        CIDR                    0.0.0.0/0
        Protocol                icmp
        FromPort                3
        ToPort                  4

  SecurityGroupRule/master-egress
        SecurityGroup           name:masters.kops.etechbrain.com
        CIDR                    0.0.0.0/0
        Egress                  true

  SecurityGroupRule/node-egress
        SecurityGroup           name:nodes.kops.etechbrain.com
        CIDR                    0.0.0.0/0
        Egress                  true

  SecurityGroupRule/node-to-master-protocol-ipip
        SecurityGroup           name:masters.kops.etechbrain.com
        Protocol                4
        SourceGroup             name:nodes.kops.etechbrain.com

  SecurityGroupRule/node-to-master-tcp-1-2379
        SecurityGroup           name:masters.kops.etechbrain.com
        Protocol                tcp
        FromPort                1
        ToPort                  2379
        SourceGroup             name:nodes.kops.etechbrain.com

  SecurityGroupRule/node-to-master-tcp-2382-4001
        SecurityGroup           name:masters.kops.etechbrain.com
        Protocol                tcp
        FromPort                2382
        ToPort                  4001
        SourceGroup             name:nodes.kops.etechbrain.com

  SecurityGroupRule/node-to-master-tcp-4003-65535
        SecurityGroup           name:masters.kops.etechbrain.com
        Protocol                tcp
        FromPort                4003
        ToPort                  65535
        SourceGroup             name:nodes.kops.etechbrain.com

  SecurityGroupRule/node-to-master-udp-1-65535
        SecurityGroup           name:masters.kops.etechbrain.com
        Protocol                udp
        FromPort                1
        ToPort                  65535
        SourceGroup             name:nodes.kops.etechbrain.com

  SecurityGroupRule/ssh-external-to-master-0.0.0.0/0
        SecurityGroup           name:masters.kops.etechbrain.com
        CIDR                    0.0.0.0/0
        Protocol                tcp
        FromPort                22
        ToPort                  22

  SecurityGroupRule/ssh-external-to-node-0.0.0.0/0
        SecurityGroup           name:nodes.kops.etechbrain.com
        CIDR                    0.0.0.0/0
        Protocol                tcp
        FromPort                22
        ToPort                  22

Will modify resources:
  Subnet/ap-south-1a.kops.etechbrain.com
        Tags                     {} -> {SubnetType: Private, kubernetes.io/role/internal-elb: 1, kubernetes.io/cluster/kops.etechbrain.com: shared}

  Subnet/ap-south-1b.kops.etechbrain.com
        Tags                     {} -> {kubernetes.io/cluster/kops.etechbrain.com: shared, SubnetType: Private, kubernetes.io/role/internal-elb: 1}

  Subnet/ap-south-1c.kops.etechbrain.com
        Tags                     {} -> {kubernetes.io/cluster/kops.etechbrain.com: shared, SubnetType: Private, kubernetes.io/role/internal-elb: 1}

  Subnet/utility-ap-south-1a.kops.etechbrain.com
        Tags                     {} -> {kubernetes.io/cluster/kops.etechbrain.com: shared, SubnetType: Utility, kubernetes.io/role/elb: 1}

  Subnet/utility-ap-south-1b.kops.etechbrain.com
        Tags                     {} -> {kubernetes.io/cluster/kops.etechbrain.com: shared, SubnetType: Utility, kubernetes.io/role/elb: 1}

  Subnet/utility-ap-south-1c.kops.etechbrain.com
        Tags                     {} -> {kubernetes.io/cluster/kops.etechbrain.com: shared, SubnetType: Utility, kubernetes.io/role/elb: 1}

Must specify --yes to apply changes
[ec2-user@ip-12-0-15-146 ~]$ kops update cluster --name ${CLUSTER_NAME} --state ${KOPS_STATE_STORE} --yes

*********************************************************************************

A new kubernetes version is available: 1.13.12
Upgrading is recommended (try kops upgrade cluster)

More information: https://github.com/kubernetes/kops/blob/master/permalinks/upgrade_k8s.md#1.13.12

*********************************************************************************


*********************************************************************************

Kubelet anonymousAuth is currently turned on. This allows RBAC escalation and remote code execution possibilities.
It is highly recommended you turn it off by setting 'spec.kubelet.anonymousAuth' to 'false' via 'kops edit cluster'

See https://github.com/kubernetes/kops/blob/master/docs/security.md#kubelet-api

*********************************************************************************

I1231 09:10:50.696551   23924 context.go:249] hit maximum retries 1 with error file does not exist
I1231 09:10:52.160560   23924 context.go:249] hit maximum retries 1 with error file does not exist
W1231 09:10:55.073368   23924 firewall.go:250] Opening etcd port on masters for access from the nodes, for calico.  This is unsafe in untrusted environments.
I1231 09:10:55.521785   23924 executor.go:103] Tasks: 0 done / 111 total; 50 can run
I1231 09:10:56.959672   23924 vfs_castore.go:729] Issuing new certificate: "etcd-peers-ca-events"
I1231 09:10:57.440120   23924 vfs_castore.go:729] Issuing new certificate: "etcd-peers-ca-main"
I1231 09:10:58.097958   23924 vfs_castore.go:729] Issuing new certificate: "etcd-manager-ca-main"
I1231 09:10:58.179094   23924 vfs_castore.go:729] Issuing new certificate: "etcd-clients-ca"
I1231 09:10:58.186742   23924 vfs_castore.go:729] Issuing new certificate: "apiserver-aggregator-ca"
I1231 09:10:58.352613   23924 vfs_castore.go:729] Issuing new certificate: "etcd-manager-ca-events"
I1231 09:10:58.657333   23924 vfs_castore.go:729] Issuing new certificate: "ca"
I1231 09:10:58.763254   23924 executor.go:103] Tasks: 50 done / 111 total; 28 can run
I1231 09:10:59.687796   23924 vfs_castore.go:729] Issuing new certificate: "kubecfg"
I1231 09:10:59.835244   23924 vfs_castore.go:729] Issuing new certificate: "apiserver-aggregator"
I1231 09:11:00.357444   23924 vfs_castore.go:729] Issuing new certificate: "kube-scheduler"
I1231 09:11:00.376354   23924 vfs_castore.go:729] Issuing new certificate: "apiserver-proxy-client"
I1231 09:11:01.145290   23924 vfs_castore.go:729] Issuing new certificate: "master"
I1231 09:11:01.160264   23924 vfs_castore.go:729] Issuing new certificate: "kubelet-api"
I1231 09:11:01.356281   23924 vfs_castore.go:729] Issuing new certificate: "kube-proxy"
I1231 09:11:01.760621   23924 vfs_castore.go:729] Issuing new certificate: "kube-controller-manager"
I1231 09:11:01.972073   23924 vfs_castore.go:729] Issuing new certificate: "kubelet"
I1231 09:11:02.201424   23924 vfs_castore.go:729] Issuing new certificate: "kops"
I1231 09:11:02.408693   23924 executor.go:103] Tasks: 78 done / 111 total; 23 can run
I1231 09:11:02.609295   23924 launchconfiguration.go:364] waiting for IAM instance profile "nodes.kops.etechbrain.com" to be ready
I1231 09:11:02.609850   23924 launchconfiguration.go:364] waiting for IAM instance profile "masters.kops.etechbrain.com" to be ready
I1231 09:11:02.624536   23924 launchconfiguration.go:364] waiting for IAM instance profile "nodes.kops.etechbrain.com" to be ready
I1231 09:11:02.625760   23924 launchconfiguration.go:364] waiting for IAM instance profile "nodes.kops.etechbrain.com" to be ready
I1231 09:11:02.635038   23924 launchconfiguration.go:364] waiting for IAM instance profile "masters.kops.etechbrain.com" to be ready
I1231 09:11:02.640123   23924 launchconfiguration.go:364] waiting for IAM instance profile "masters.kops.etechbrain.com" to be ready
I1231 09:11:12.958844   23924 executor.go:103] Tasks: 101 done / 111 total; 7 can run
I1231 09:11:13.944164   23924 executor.go:103] Tasks: 108 done / 111 total; 3 can run
I1231 09:11:17.060112   23924 executor.go:103] Tasks: 111 done / 111 total; 0 can run
I1231 09:11:17.060216   23924 dns.go:155] Pre-creating DNS records
I1231 09:11:17.761760   23924 update_cluster.go:294] Exporting kubecfg for cluster
kops has set your kubectl context to kops.etechbrain.com

Cluster is starting.  It should be ready in a few minutes.

Suggestions:
 * validate cluster: kops validate cluster
 * list nodes: kubectl get nodes --show-labels
 * ssh to the master: ssh -i ~/.ssh/id_rsa admin@api.kops.etechbrain.com
 * the admin user is specific to Debian. If not using Debian please use the appropriate user based on your OS.
 * read about installing addons at: https://github.com/kubernetes/kops/blob/master/docs/addons.md.

[ec2-user@ip-12-0-15-146 ~]$ kops validate cluster
Using cluster from kubectl context: kops.etechbrain.com

Validating cluster kops.etechbrain.com


unexpected error during validation: error listing nodes: Get https://api.kops.etechbrain.com/api/v1/nodes: EOF
[ec2-user@ip-12-0-15-146 ~]$ kubectl get nodes --show-labels
Unable to connect to the server: EOF
[ec2-user@ip-12-0-15-146 ~]$ kops validate cluster
Using cluster from kubectl context: kops.etechbrain.com

Validating cluster kops.etechbrain.com


unexpected error during validation: error listing nodes: Get https://api.kops.etechbrain.com/api/v1/nodes: EOF
[ec2-user@ip-12-0-15-146 ~]$ kubectl get nodes --show-labels
Unable to connect to the server: EOF
[ec2-user@ip-12-0-15-146 ~]$ kops rolling-update cluster $(CLUSTER_NAME) —- yes
-bash: CLUSTER_NAME: command not found

Found multiple arguments which look like a cluster name
        "—-" (as argument)
        "yes" (as argument)

This often happens if you specify an argument to a boolean flag without using =
For example: use `--bastion=true` or `--bastion`, not `--bastion true`


expected a single <clustername> to be passed as an argument
[ec2-user@ip-12-0-15-146 ~]$ kops rolling-update cluster $(CLUSTER_NAME) --yes
-bash: CLUSTER_NAME: command not found
Using cluster from kubectl context: kops.etechbrain.com

NAME                    STATUS  NEEDUPDATE      READY   MIN     MAX     NODES
master-ap-south-1a      Ready   0               1       1       1       1
master-ap-south-1b      Ready   0               1       1       1       1
master-ap-south-1c      Ready   0               1       1       1       1
nodes-ap-south-1a       Ready   0               1       1       5       1
nodes-ap-south-1b       Ready   0               1       1       5       1
nodes-ap-south-1c       Ready   0               1       1       5       1

No rolling-update required.
[ec2-user@ip-12-0-15-146 ~]$ kops validate cluster
Using cluster from kubectl context: kops.etechbrain.com

Validating cluster kops.etechbrain.com

INSTANCE GROUPS
NAME                    ROLE    MACHINETYPE     MIN     MAX     SUBNETS
master-ap-south-1a      Master  m5.large        1       1       ap-south-1a
master-ap-south-1b      Master  m5.large        1       1       ap-south-1b
master-ap-south-1c      Master  m5.large        1       1       ap-south-1c
nodes-ap-south-1a       Node    m5.xlarge       1       5       ap-south-1a
nodes-ap-south-1b       Node    m5.xlarge       1       5       ap-south-1b
nodes-ap-south-1c       Node    m5.xlarge       1       5       ap-south-1c

NODE STATUS
NAME                                            ROLE    READY
ip-12-0-109-98.ap-south-1.compute.internal      node    True
ip-12-0-121-108.ap-south-1.compute.internal     master  True
ip-12-0-49-179.ap-south-1.compute.internal      node    True
ip-12-0-62-74.ap-south-1.compute.internal       master  True
ip-12-0-68-249.ap-south-1.compute.internal      master  True
ip-12-0-91-235.ap-south-1.compute.internal      node    True

Your cluster kops.etechbrain.com is ready
[ec2-user@ip-12-0-15-146 ~]$ kubectl get nodes --show-labels
NAME                                          STATUS   ROLES    AGE     VERSION   LABELS
ip-12-0-109-98.ap-south-1.compute.internal    Ready    node     2m26s   v1.13.4   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=m5.xlarge,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=ap-south-1,failure-domain.beta.kubernetes.io/zone=ap-south-1c,kops.k8s.io/instancegroup=nodes-ap-south-1c,kubernetes.io/hostname=ip-12-0-109-98.ap-south-1.compute.internal,kubernetes.io/role=node,node-role.kubernetes.io/node=
ip-12-0-121-108.ap-south-1.compute.internal   Ready    master   3m54s   v1.13.4   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=m5.large,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=ap-south-1,failure-domain.beta.kubernetes.io/zone=ap-south-1c,kops.k8s.io/instancegroup=master-ap-south-1c,kubernetes.io/hostname=ip-12-0-121-108.ap-south-1.compute.internal,kubernetes.io/role=master,node-role.kubernetes.io/master=
ip-12-0-49-179.ap-south-1.compute.internal    Ready    node     2m39s   v1.13.4   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=m5.xlarge,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=ap-south-1,failure-domain.beta.kubernetes.io/zone=ap-south-1a,kops.k8s.io/instancegroup=nodes-ap-south-1a,kubernetes.io/hostname=ip-12-0-49-179.ap-south-1.compute.internal,kubernetes.io/role=node,node-role.kubernetes.io/node=
ip-12-0-62-74.ap-south-1.compute.internal     Ready    master   3m48s   v1.13.4   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=m5.large,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=ap-south-1,failure-domain.beta.kubernetes.io/zone=ap-south-1a,kops.k8s.io/instancegroup=master-ap-south-1a,kubernetes.io/hostname=ip-12-0-62-74.ap-south-1.compute.internal,kubernetes.io/role=master,node-role.kubernetes.io/master=
ip-12-0-68-249.ap-south-1.compute.internal    Ready    master   3m53s   v1.13.4   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=m5.large,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=ap-south-1,failure-domain.beta.kubernetes.io/zone=ap-south-1b,kops.k8s.io/instancegroup=master-ap-south-1b,kubernetes.io/hostname=ip-12-0-68-249.ap-south-1.compute.internal,kubernetes.io/role=master,node-role.kubernetes.io/master=
ip-12-0-91-235.ap-south-1.compute.internal    Ready    node     2m38s   v1.13.4   beta.kubernetes.io/arch=amd64,beta.kubernetes.io/instance-type=m5.xlarge,beta.kubernetes.io/os=linux,failure-domain.beta.kubernetes.io/region=ap-south-1,failure-domain.beta.kubernetes.io/zone=ap-south-1b,kops.k8s.io/instancegroup=nodes-ap-south-1b,kubernetes.io/hostname=ip-12-0-91-235.ap-south-1.compute.internal,kubernetes.io/role=node,node-role.kubernetes.io/node=
[ec2-user@ip-12-0-15-146 ~]$
[ec2-user@ip-12-0-15-146 ~]$ kops delete cluster --name ${CLUSTER_NAME} --yes
TYPE                    NAME                                                                            ID
autoscaling-config      master-ap-south-1a.masters.kops.etechbrain.com-20191231091102                   master-ap-south-1a.masters.kops.etechbrain.com-20191231091102
autoscaling-config      master-ap-south-1b.masters.kops.etechbrain.com-20191231091102                   master-ap-south-1b.masters.kops.etechbrain.com-20191231091102
autoscaling-config      master-ap-south-1c.masters.kops.etechbrain.com-20191231091102                   master-ap-south-1c.masters.kops.etechbrain.com-20191231091102
autoscaling-config      nodes-ap-south-1a.kops.etechbrain.com-20191231091102                            nodes-ap-south-1a.kops.etechbrain.com-20191231091102
autoscaling-config      nodes-ap-south-1b.kops.etechbrain.com-20191231091102                            nodes-ap-south-1b.kops.etechbrain.com-20191231091102
autoscaling-config      nodes-ap-south-1c.kops.etechbrain.com-20191231091102                            nodes-ap-south-1c.kops.etechbrain.com-20191231091102
autoscaling-group       master-ap-south-1a.masters.kops.etechbrain.com                                  master-ap-south-1a.masters.kops.etechbrain.com
autoscaling-group       master-ap-south-1b.masters.kops.etechbrain.com                                  master-ap-south-1b.masters.kops.etechbrain.com
autoscaling-group       master-ap-south-1c.masters.kops.etechbrain.com                                  master-ap-south-1c.masters.kops.etechbrain.com
autoscaling-group       nodes-ap-south-1a.kops.etechbrain.com                                           nodes-ap-south-1a.kops.etechbrain.com
autoscaling-group       nodes-ap-south-1b.kops.etechbrain.com                                           nodes-ap-south-1b.kops.etechbrain.com
autoscaling-group       nodes-ap-south-1c.kops.etechbrain.com                                           nodes-ap-south-1c.kops.etechbrain.com
iam-instance-profile    masters.kops.etechbrain.com                                                     masters.kops.etechbrain.com
iam-instance-profile    nodes.kops.etechbrain.com                                                       nodes.kops.etechbrain.com
iam-role                masters.kops.etechbrain.com                                                     masters.kops.etechbrain.com
iam-role                nodes.kops.etechbrain.com                                                       nodes.kops.etechbrain.com
instance                master-ap-south-1a.masters.kops.etechbrain.com                                  i-0539614e05e74df88
instance                master-ap-south-1b.masters.kops.etechbrain.com                                  i-0b06248857564841c
instance                master-ap-south-1c.masters.kops.etechbrain.com                                  i-0fb3eebf1cfcdd5db
instance                nodes-ap-south-1a.kops.etechbrain.com                                           i-0d73d445e12615ab5
instance                nodes-ap-south-1b.kops.etechbrain.com                                           i-02632aeb2fb1cff80
instance                nodes-ap-south-1c.kops.etechbrain.com                                           i-00163eb8ea3c46797
keypair                 kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90  kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90
load-balancer           api.kops.etechbrain.com                                                         api-kops-etechbrain-com-iuuvt2
route53-record          api.internal.kops.etechbrain.com.                                               Z1YQJ6NMMAOM0G/api.internal.kops.etechbrain.com.
route53-record          api.kops.etechbrain.com.                                                        Z1YQJ6NMMAOM0G/api.kops.etechbrain.com.
security-group          api-elb.kops.etechbrain.com                                                     sg-044570d0ab08858ca
security-group          masters.kops.etechbrain.com                                                     sg-0225d7717521b6bd0
security-group          nodes.kops.etechbrain.com                                                       sg-06a881dfbfa89ce8c
volume                  a.etcd-events.kops.etechbrain.com                                               vol-087e28e3f6125619a
volume                  a.etcd-main.kops.etechbrain.com                                                 vol-083f488ae16ce9ba4
volume                  b.etcd-events.kops.etechbrain.com                                               vol-04c8f4f6c321e50ef
volume                  b.etcd-main.kops.etechbrain.com                                                 vol-07e5337872a80004e
volume                  c.etcd-events.kops.etechbrain.com                                               vol-08a7cd563cd376f1a
volume                  c.etcd-main.kops.etechbrain.com                                                 vol-0620b15158025f918

load-balancer:api-kops-etechbrain-com-iuuvt2    ok
keypair:kubernetes.kops.etechbrain.com-d9:42:74:4a:bc:ed:6c:8f:f0:59:ef:db:9f:d2:94:90  ok
instance:i-0b06248857564841c    ok
instance:i-02632aeb2fb1cff80    ok
autoscaling-group:nodes-ap-south-1a.kops.etechbrain.com ok
instance:i-0fb3eebf1cfcdd5db    ok
instance:i-0539614e05e74df88    ok
instance:i-00163eb8ea3c46797    ok
instance:i-0d73d445e12615ab5    ok
autoscaling-group:master-ap-south-1a.masters.kops.etechbrain.com        ok
autoscaling-group:nodes-ap-south-1b.kops.etechbrain.com ok
autoscaling-group:master-ap-south-1b.masters.kops.etechbrain.com        ok
autoscaling-group:nodes-ap-south-1c.kops.etechbrain.com ok
autoscaling-group:master-ap-south-1c.masters.kops.etechbrain.com        ok
route53-record:Z1YQJ6NMMAOM0G/api.kops.etechbrain.com.  ok
iam-instance-profile:nodes.kops.etechbrain.com  ok
iam-instance-profile:masters.kops.etechbrain.com        ok
iam-role:masters.kops.etechbrain.com    ok
iam-role:nodes.kops.etechbrain.com      ok
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
autoscaling-config:master-ap-south-1a.masters.kops.etechbrain.com-20191231091102        ok
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
autoscaling-config:nodes-ap-south-1b.kops.etechbrain.com-20191231091102 ok
autoscaling-config:master-ap-south-1c.masters.kops.etechbrain.com-20191231091102        ok
autoscaling-config:nodes-ap-south-1a.kops.etechbrain.com-20191231091102 ok
autoscaling-config:master-ap-south-1b.masters.kops.etechbrain.com-20191231091102        ok
autoscaling-config:nodes-ap-south-1c.kops.etechbrain.com-20191231091102 ok
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-044570d0ab08858ca     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-044570d0ab08858ca
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-044570d0ab08858ca     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        volume:vol-087e28e3f6125619a
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-044570d0ab08858ca
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-044570d0ab08858ca     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-044570d0ab08858ca
        security-group:sg-0225d7717521b6bd0
        volume:vol-087e28e3f6125619a
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-044570d0ab08858ca     ok
Not all resources deleted; waiting before reattempting deletion
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        volume:vol-087e28e3f6125619a
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-04c8f4f6c321e50ef
        volume:vol-08a7cd563cd376f1a
        security-group:sg-0225d7717521b6bd0
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        volume:vol-087e28e3f6125619a
        security-group:sg-06a881dfbfa89ce8c
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
        security-group:sg-0225d7717521b6bd0
        volume:vol-087e28e3f6125619a
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        volume:vol-04c8f4f6c321e50ef
        volume:vol-08a7cd563cd376f1a
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-0620b15158025f918    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-0620b15158025f918
        volume:vol-07e5337872a80004e
        volume:vol-08a7cd563cd376f1a
        volume:vol-04c8f4f6c321e50ef
volume:vol-07e5337872a80004e    still has dependencies, will retry
volume:vol-04c8f4f6c321e50ef    still has dependencies, will retry
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-0620b15158025f918    ok
volume:vol-087e28e3f6125619a    still has dependencies, will retry
volume:vol-08a7cd563cd376f1a    ok
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
        volume:vol-07e5337872a80004e
        volume:vol-04c8f4f6c321e50ef
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-07e5337872a80004e    ok
volume:vol-04c8f4f6c321e50ef    ok
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        security-group:sg-06a881dfbfa89ce8c
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
volume:vol-083f488ae16ce9ba4    still has dependencies, will retry
volume:vol-087e28e3f6125619a    still has dependencies, will retry
security-group:sg-0225d7717521b6bd0     still has dependencies, will retry
security-group:sg-06a881dfbfa89ce8c     ok
Not all resources deleted; waiting before reattempting deletion
        security-group:sg-0225d7717521b6bd0
        volume:vol-087e28e3f6125619a
        volume:vol-083f488ae16ce9ba4
volume:vol-087e28e3f6125619a    ok
volume:vol-083f488ae16ce9ba4    ok
security-group:sg-0225d7717521b6bd0     ok
Deleted kubectl config for kops.etechbrain.com

Deleted cluster: "kops.etechbrain.com"
[ec2-user@ip-12-0-15-146 ~]$
