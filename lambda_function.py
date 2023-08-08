#
import boto3
import time
from datetime import datetime, timedelta
AWS_REGION = 'ap-south-1'  # Replace with your desired region
EC2_INSTANCE_ID = 'give your instance id'  # Replace with your EC2 instance ID
CPU_THRESHOLD = 70.0  # Set the CPU utilization threshold
WAIT_TIME_SECONDS = 300

def lambda_handler(event, context):
    # Initialize the EC2 client
    ec2 = boto3.client('ec2', region_name=AWS_REGION)

    # Start the specified EC2 instance
    ec2.start_instances(InstanceIds=[EC2_INSTANCE_ID])
    
    print(f'Starting the instance: {EC2_INSTANCE_ID}')

    # Wait for 5 minutes (300 seconds)
    time.sleep(WAIT_TIME_SECONDS)

    # Initialize the CloudWatch client
    cloudwatch = boto3.client('cloudwatch', region_name=AWS_REGION)
    
    end_time = datetime.utcnow()
    start_time = end_time - timedelta(seconds=WAIT_TIME_SECONDS)
    
    # Create an SNS client
    sns = boto3.client('sns', region_name=AWS_REGION)

    # Create an SNS topic
    topic_name = 'tester'  # Replace with your desired topic name
    response = sns.create_topic(Name=topic_name)

    # Extract the ARN (Amazon Resource Name) of the created topic
    topic_arn = response['TopicArn']
    
    subscriptions = sns.list_subscriptions_by_topic(TopicArn=topic_arn)
    email_address = 'give your email address'  # Replace with your email address
    
    if not any(subscription['Protocol'] == 'email' and subscription['Endpoint'] == email_address for subscription in subscriptions['Subscriptions']):
        # Email address is not subscribed, so subscribe it
        response = sns.subscribe(
            TopicArn=topic_arn,
            Protocol='email',
            Endpoint=email_address
        )
    

    cloudwatch.put_metric_alarm(
        AlarmName='Web_Server_CPU_Utilization',
        ComparisonOperator='GreaterThanThreshold',  # Check for greater than the threshold
        EvaluationPeriods=1,
        MetricName='CPUUtilization',
        Namespace='AWS/EC2',
        Period=60,
        Statistic='Average',
        Threshold=CPU_THRESHOLD,  # Set the threshold for CPU utilization
        ActionsEnabled=True,  # Enable actions
        AlarmActions=[  # Specify the actions to take when the alarm state is triggered
            'give your ARN here',  # Replace with your SNS topic ARN
        ],
        Dimensions=[
            {
                'Name': 'InstanceId',
                'Value': EC2_INSTANCE_ID
            },
        ],
        Unit='Percent'
    )
    
    # Get CPU utilization data for the last 5 minutes
    response = cloudwatch.get_metric_data(
        MetricDataQueries=[
            {
                'Id': 'm1',
                'MetricStat': {
                    'Metric': {
                        'Namespace': 'AWS/EC2',
                        'MetricName': 'CPUUtilization',
                        'Dimensions': [
                            {
                                'Name': 'InstanceId',
                                'Value': EC2_INSTANCE_ID
                            },
                        ]
                    },
                    'Period': 60,  # One data point per minute
                    'Stat': 'Average',
                },
                'ReturnData': True,
            },
        ],
        StartTime=start_time,
        EndTime=end_time
    )
    values = response['MetricDataResults'][0]['Values']
    if all(value < CPU_THRESHOLD for value in values):
        sns.publish(
            TopicArn=topic_arn,  # Use the ARN of the created topic
            Message=f"EC2 instance {EC2_INSTANCE_ID} is being stopped due to inactivity.",
            Subject="EC2 Instance Inactivity Alert"
        )
        ec2.stop_instances(InstanceIds=[EC2_INSTANCE_ID])
        print(f'CPU utilization is below the threshold. Instance is stopped.')
    else:
        print(f'CPU utilization exceeded the threshold. Instance is not stopped.')
