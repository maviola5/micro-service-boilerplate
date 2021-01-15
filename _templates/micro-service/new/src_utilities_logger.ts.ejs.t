---
to: src/utilities/logger.ts
---
import { transports, createLogger, format } from 'winston';

export const logger = createLogger({
  level: 'info',
  format: format.json(),
  transports: [new transports.Console()],
});
