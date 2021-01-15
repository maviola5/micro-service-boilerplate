---
to: src/resource.ts
---
import KoaRouter from 'koa-router';
import { Context } from 'koa';
import { environment } from './environments/environment';

const resource = new KoaRouter({ prefix: '/status' });

resource.get('/', (ctx: Context) => {
  console.log('ENVIRONMENT: ' + environment.production);
  ctx.body = 'ok';
});

export { resource };
