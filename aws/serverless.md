Install CDK
===============================================================================

```
npm install -g aws-cdk
```

Get Started
===============================================================================

1. **Create app** from a template provided by AWS CDK
2. Add code to app to **create resources within stacks**.
3. Build app (optional: AWS CDK will do It If you forget)
4. Synthesize one or more stacks in the app to **create AWS cfn template**.
5. **Deploy one or more stacks** to your AWS account.

## Build

Catches syntax and type error

## Synthesize

Catches logical errors in AWS resources.

Creates cdk.out folder with generated cfn template.

## Deploy

May find permission issues.

AWS CDK synthesizes the stack before each deployment automatically.

## Bootstrap

When cfn template uses assets, for example aws lambda, It have to be saved in s3,
bootstrap with `cdk bootstrap` generates It.

## Your first app

```
cdk init app --language typescript     # Create new app
cdk ls                                 # List stacks in app
cdk synth                              # Generate template yaml file
cdk deploy
cdk diff                               # Watch stack changes
cdk bootstrap                          # Generates s3 bucket for deploy assets
cdk destroy                            # Delete cfn stacks deployed.
```

Sample

```
import * as cdk from '@aws-cdk/core';
import * as s3 from '@aws-cdk/aws-s3';

export class HelloCdkStack extends cdk.Stack {
  constructor(scope: cdk.App, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    new s3.Bucket(this, 'MyFirstBucket', {
      versioned: true
    });
  }
}

```

Resources get 3 params:

- scope: Stack parent, so It's own class in general.
- Id: Resource name
- props: To define resource.

## Project structure

```
lib/cdk-workshop-stack.ts   # CDK app main stack
bin/cdk-workshop.ts         # Entry point of CDK app
cdk.json                    # Tell toolkit how to run app
```

