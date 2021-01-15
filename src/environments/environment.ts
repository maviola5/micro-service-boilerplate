export const environment = {
  production: false,
  isLambda: !!(process.env.LAMBDA_TASK_ROOT || process.env.AWS_EXECUTION_ENV),
};
