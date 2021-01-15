---
to: src/index.ts
---
import serverless from 'serverless-http';
import { app } from './app';
import { environment } from './environments/environment';

if (!environment.isLambda) {
  app.listen(8000, () => {
    console.log('app listening on port 8000');
  });
}

export const handler = serverless(app);
