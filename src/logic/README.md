This directory contains the "logic tier" for the Express application.

Files:
- router.ts: Express Router exposing logic endpoints.
- userService.ts: Simple in-memory service implementing business logic for users.

How to wire into your Express app (example):

```ts
import express from 'express';
import logicRouter from './src/logic/router';

const app = express();
app.use(express.json());

// Mount the logic tier under /api
app.use('/api', logicRouter);

app.listen(3000, () => console.log('listening on :3000'));
```

Notes:
- The service is intentionally simple and in-memory so it can work without a database.
- For production, replace the in-memory store with a proper persistent layer and add validation.
