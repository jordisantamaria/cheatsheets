S3
===============================================================================

```bash
aws s3 ls                                             # list folders
aws s3 cp s3://path_origin s3://path --recursive      # copy folder to new s3 bucket
```

ECS
===============================================================================

```

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
