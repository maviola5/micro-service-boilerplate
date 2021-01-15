---
to: src/environments/environment.ts
---
import dotenv from 'dotenv';
dotenv.config();

export const environment = {
  production: process.env.NODE_ENV === 'production',
  isLambda: !!(process.env.LAMBDA_TASK_ROOT || process.env.AWS_EXECUTION_ENV),
};
