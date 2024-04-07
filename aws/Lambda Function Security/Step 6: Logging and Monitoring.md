# Step 6: Logging and Monitoring

Logging and monitoring are essential for maintaining the security and performance of AWS Lambda functions. This step focuses on setting up comprehensive logging and monitoring solutions to detect and respond to security incidents, performance issues, and operational events effectively.

## CloudWatch Logs for Lambda Functions

AWS Lambda automatically streams logs to Amazon CloudWatch Logs, allowing you to monitor function execution, troubleshoot errors, and analyze performance metrics. Let's dive into practical examples for configuring CloudWatch Logs:

### 1. Enable Logging

```bash
aws lambda update-function-configuration --function-name MyLambdaFunction --log-type Tail
```

This AWS CLI command enables logging for a Lambda function named MyLambdaFunction.

### 2. Log Retention

```bash
aws logs put-retention-policy --log-group-name /aws/lambda/MyLambdaFunction --retention-in-days 30
```

This command sets a retention policy of 30 days for logs of the Lambda function MyLambdaFunction.

### 3. Log Filtering and Metric Extraction
Configure log filters and metric extractions in CloudWatch Logs using CloudFormation:
```yaml
Resources:
  MyLogMetricFilter:
    Type: AWS::Logs::MetricFilter
    Properties:
      LogGroupName: /aws/lambda/MyLambdaFunction
      FilterPattern: "[ERROR]"
      MetricTransformations:
        - MetricName: ErrorCount
          MetricNamespace: MyNamespace
          MetricValue: "1"
          DefaultValue: "0"
```

This CloudFormation snippet creates a metric filter that counts occurrences of the string "[ERROR]" in the logs of the Lambda function MyLambdaFunction.

##mCloudWatch Alarms for Monitoring

AWS CloudWatch Alarms allow you to set up notifications for specific events or thresholds in your Lambda function metrics. Let's create a CloudWatch Alarm for monitoring Lambda function duration:

### 1. Metric Thresholds

```bash
aws cloudwatch put-metric-alarm \
--alarm-name LambdaFunctionDuration \
--alarm-description "Alarm for Lambda function duration exceeding threshold" \
--metric-name Duration \
--namespace AWS/Lambda \
--statistic Average \
--period 60 \
--threshold 500 \
--comparison-operator GreaterThanOrEqualToThreshold \
--evaluation-periods 1 \
--actions-enabled \
--alarm-actions <SNS_TOPIC_ARN>
```
This command creates a CloudWatch Alarm that triggers a notification when the average duration of the Lambda function exceeds 500 milliseconds.

### 2. Notification Actions
Specify an SNS topic ARN for receiving notifications when the CloudWatch Alarm is triggered.







