------------------------------------------------------------------------------------------------------------------------------------------
Pre-Requiest:
------------------------------------------------------------------------------------------------------------------------------------------
1) Create a IAM role with SSMFullaccess
2) Attach a Role to EC2 Instances
3) Install & Start a amazon ssm agent
4) Configure the AWS CLI in your System & follow the below Steps

------------------------------------------------------------------------------------------------------------------------------------------
Step:1: Create a trusted policy with SSM & EC2 json file
------------------------------------------------------------------------------------------------------------------------------------------

cat > "automationssm-trustpolicy.json" << "EOF"
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ssm.amazonaws.com",
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

------------------------------------------------------------------------------------------------------------------------------------------
Step:2: Create a IAM Role(ec2startstopautomationssm) using automationssm-trustpolicy.json
------------------------------------------------------------------------------------------------------------------------------------------

aws iam create-role --role-name ec2startstopautomationssm --assume-role-policy-document "file://automationssm-trustpolicy.json"

aws iam get-role --role-name ec2startstopautomationssm

------------------------------------------------------------------------------------------------------------------------------------------
Step:3: Create a Inline policy(automationssm-rolepolicy.json) for EC2 instance start & stop
------------------------------------------------------------------------------------------------------------------------------------------

cat > "automationssm-rolepolicy.json" << "EOF"
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "arn:aws:lambda:*:*:function:Automation*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:StartInstances",
                "ec2:RunInstances",
                "ec2:StopInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeTags"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "ssm:*"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "sns:Publish"
            ],
            "Resource": [
                "arn:aws:sns:*:*:Automation*"
            ]
        }
    ]
}
EOF

------------------------------------------------------------------------------------------------------------------------------------------
Step:4: We created a Inline policy(automationssm-rolepolicy.json) to attach to role ec2startstopautomationssm
------------------------------------------------------------------------------------------------------------------------------------------

aws iam put-role-policy --role-name ec2startstopautomationssm --policy-name automationssm-rolepolicy --policy-document "file://automationssm-rolepolicy.json"

------------------------------------------------------------------------------------------------------------------------------------------
Step:5: Create a trusted json policy utomationssm-cloudwatcheventpolicy.json for CloudwatchEvent 
------------------------------------------------------------------------------------------------------------------------------------------
cat > "automationssm-cloudwatcheventpolicy.json" << "EOF"
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

------------------------------------------------------------------------------------------------------------------------------------------
Step:6: create a role (ec2startstopautomationssmcloudwatchevent) with help of policy (automationssm-cloudwatcheventpolicy.json) 
------------------------------------------------------------------------------------------------------------------------------------------

aws iam create-role --role-name ec2startstopautomationssmcloudwatchevent --assume-role-policy-document "file://automationssm-cloudwatcheventpolicy.json"

aws iam get-role --role-name ec2startstopautomationssmcloudwatchevent

------------------------------------------------------------------------------------------------------------------------------------------
Step:7: create a policy automationssm-CloudWatchEventsrolepolicy.json 
------------------------------------------------------------------------------------------------------------------------------------------
cat > "automationssm-CloudWatchEventsrolepolicy.json" << "EOF"
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "CloudWatchEventsBuiltInTargetExecutionAccess",
            "Effect": "Allow",
            "Action": [
                "ec2:RebootInstances",
                "ec2:StopInstances"
            ],
            "Resource": "*"
        }
    ]
}
EOF

------------------------------------------------------------------------------------------------------------------------------------------
Step:8: Add a policy(automationssm-CloudWatchEventsrolepolicy.json) to role(ec2startstopautomationssmcloudwatchevent)
------------------------------------------------------------------------------------------------------------------------------------------

aws iam put-role-policy --role-name ec2startstopautomationssmcloudwatchevent --policy-name automationssm-rolepolicy --policy-document "file://automationssm-CloudWatchEventsrolepolicy.json"

------------------------------------------------------------------------------------------------------------------------------------------
Step:9: create a cloudwatch events rule using cron expression with target specified ec2 instance ID Start
------------------------------------------------------------------------------------------------------------------------------------------

aws events put-rule --name "WebApp1-StartEC2Instance" --schedule-expression "cron(0 9 * * ? *)"

aws events put-targets --rule WebApp1-StartEC2Instance --targets '{"Arn": "arn:aws:ssm:ap-south-1:872599169723:automation-definition/AWS-StartEC2Instance","Input":"{\"InstanceId\":[\"i-0100dbbe4de2691fc\"],\"AutomationAssumeRole\":[\"arn:aws:iam::872599169723:role/automationssm\"]}","Id": "Target1","RoleArn": "arn:aws:iam::872599169723:role/ec2startstopautomationssmcloudwatchevent"}'

------------------------------------------------------------------------------------------------------------------------------------------
Step:10: create a cloudwatch events rule using cron expression with target specified ec2 instance ID Start
------------------------------------------------------------------------------------------------------------------------------------------
aws events put-rule --name "WebApp1-StopEC2Instance" --schedule-expression "cron(0 18 * * ? *)"

aws events put-targets --rule WebApp1-StartEC2Instance --targets '{"Arn": "arn:aws:ssm:ap-south-1:872599169723:automation-definition/AWS-StopEC2Instance","Input":"{\"InstanceId\":[\"i-0100dbbe4de2691fc\"],\"AutomationAssumeRole\":[\"arn:aws:iam::872599169723:role/automationssm\"]}","Id": "Target1","RoleArn": "arn:aws:iam::872599169723:role/ec2startstopautomationssmcloudwatchevent"}'

------------------------------------------------------------------------------------------------------------------------------------------
