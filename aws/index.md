S3
===============================================================================

```
aws s3 ls                                             # list folders
aws s3 cp s3://path_origin s3://path --recursive      # copy folder to new s3 bucket
```

Secrets Manager
===============================================================================
```
aws secretsmanager get-secret-value --secret-id [secrets-name]  | jq '. | .SecretString' | jq . -r | jq .
```

ECS
===============================================================================

```
# For change number of services
aws ecs update-service --service xxxx  --cluster xxxx --desired-count 3
```

SAM
===============================================================================

```

```

CLOUDFORMATION
===============================================================================

```

```


Autoscaling steps:

```
ServiceScaleOutPolicy:
		Type: AWS::ApplicationAutoScaling::ScalingPolicy
		Properties:
				PolicyName: !Sub '${PJPrefix}-${EnvPrefix}-${SysPrefix}-ScaleOutPolicy'
				PolicyType: 'StepScaling'
				ScalingTargetId: !Ref ServiceScalingTarget
				StepScalingPolicyConfiguration:
						AdjustmentType: 'ChangeInCapacity'
						Cooldown: 0
						MetricAggregationType: 'Minimum'
						StepAdjustments:
								- ScalingAdjustment: 2 # +2 instances
									MetricIntervalLowerBound: 0
									MetricIntervalUpperBound: 2 # from 3 to 5
								- ScalingAdjustment: 7 # +5 instances
									MetricIntervalLowerBound: 2
									MetricIntervalUpperBound: 7 # from 5 to 10
								- ScalingAdjustment: 17 # +10 instances
									MetricIntervalLowerBound: 7  # from 10 to infinite
		DependsOn: 'ServiceScalingTarget'
```

Logging
===============================================================================

For get logs from cloudwatch

```
awslogs groups | grep [filter]
awslogs get [group_name]
```



PRICINGS
===========================

RDS minimum: 12 dolars / month
Secrets manager: 0.4 for key / month
S3 get data is very expensive, so can't be used as database.



Amplify
===============================================================================

## Create project

```
amplify init
```

## CLI basic

```
amplify pull        # pull changes of remote
amplify push        # push local changes on remote, so aws resources get updated
amplify publish     # Upload website code and deploy
amplify console     # Open aws console with resources deployed

amplify env add          # Create new environment dev/prod/stg
amplify env checkout dev     # Change to another environment
```


## Auth with cognito

```
amplify auth import      # Import an existing aws cognito resources, to be used with current environment
amplify auth add         # Create new aws cognito resources for this environment
amplify auth remove      # Unlink current aws cognito setup. Don't remove aws resources.
```

## Console

```
amplify add storage     # Creates s3 bucket for website and update aws-exports config.
```

## Codegen

```
# With --apiId includes an api generated outside amplify, so commands such as amplify api update can't be used.
amplify add codegen --apiId hsshhhwl6ngvbhu5h3hwaj4sdfs       
```
