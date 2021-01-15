import { Context, Next } from 'koa';
import { logger } from '../utilities/logger';

export const errorHandler = () => async (ctx: Context, next: Next) => {
  try {
    await next();
  } catch (err) {
    logger.info(err);
    ctx.status = err.status || 500;
    ctx.body = err.message;
  }
};
