SNS
===

Example:

    sns = Sns.new(aws_access_key, aws_secret_key)
    topic = sns.topic('arn:aws:sns:us-east-1:123456789012:test')
    topic.subscribe('email', 'someone@example.com')
    topic.publish('Hello', 'World')
    
This is not a complete implementation of the SNS API. Currently only the subscribe and publish actions are supported.