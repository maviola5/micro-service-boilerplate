---
to: src/app.ts
---
import Koa from 'koa';
import koaBodyParser from 'koa-bodyparser';
import { errorHandler } from './middleware/error-handler';
import { resource } from './resource';
import { requestLogger } from './middleware/request-logger';

const app = new Koa();
app.use(requestLogger());
app.use(koaBodyParser());
app.use(errorHandler());
app.use(resource.routes());
app.use(resource.allowedMethods());

export { app };
