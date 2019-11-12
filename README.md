# devops-tf-test
devops terraform hiring test.

The tree structure of my tf code is as follows:
/root
  /aws #specific provider - in this case - AWS.
    /global-services #this is a directory to hold global services not tied to a specific region (eg route53)
    /us-east-1 #this is the region of the resource - i break resources down by region
      /vpc #this is the resource being created in that region - listed above
      /app #specific apps for vpc - in this case webserver
  /modules #this is reusable piece of code - that can be called multiple times by resources from different regions.

In this code - terraform will create a vpc that contains the following:
1. ACL and Subnets for:
  a. private subnet
  b. app subnet
  c. db subnet
  d. public subnet
  e. dmz subnet
  f. vpn subnet
2. DHCP options - attached to new VPC.
3. IGW (Internet Gateway) attached to new VPC.
4. bastion host - allow only ingress from my NAT IP (please change this to your NAT IP) in the terraform.tfvars file
5. NAT GW attached to private subnets.
6. EIP which will be attached to bastion hosts.
7. Route and Route tables:
  a. private subnet - allow egress out NATGW.
  b. app subnet - allow egress out NATGW.
  c. db subnet - allow egress out NATGW.
  d. public subnet - allow egress out IGW.
  e. dmz subnet - allow egress out IGW.
  f. vpn subnet - allow egress out IGW.
8. s3 endpoints - to allow s3 access via AWS endpoint instead of public Internet. (just my preference)

Order of execution:

Infrastructure and VPC:
1a. Add your system's pub ssh-key (or create a new one) to terraform.tfvars files under /root/aws/us-east-1/vpc.
1. Create the VPC - this is created by going to the /root/aws/us-east-1 then performing
terraform plan
#check the output - should list what resources will be created - once confirmed
terraform apply
#creates the VPC and all underlying infrastructure

Web App:
From within the:
/aws/us-east-1/app/web-server
#this is the application directory for running ubuntu and apache2
Please add your ssh-key to the ssh-key-dev variable under terraform.tfvars
#ideally this would be same key used in bastion to allow ssh keyforwarding from your workstation.
perform a terraform plan - check output
perform a terraform apply - see the resources being created.

The following should be created:
new ALB with corresponding target groups
sg for alb and webserver ec2 instance
asg for webserver ec2 instance, change min, max, desired numbers in terraform.tfvars for number running instances.

The apache2 index.html is being populated via user-data - ideally, this would be created via packer or config mgmt.
I didn't want to overcomplicate things for you to test out my code.

You can access the webserver via ssh utilizing the bastion host. You will want to use key forwarding and ssh first to
bastion then to the webserver.

