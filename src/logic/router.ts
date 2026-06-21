import { Router, Request, Response } from 'express';
import { getUsers, createUser } from './userService';

const logicRouter = Router();

// GET /api/users
logicRouter.get('/users', async (_req: Request, res: Response) => {
  try {
    const users = await getUsers();
    res.json(users);
  } catch (err) {
    res.status(500).json({ error: 'Failed to fetch users' });
  }
});

// POST /api/users
logicRouter.post('/users', async (req: Request, res: Response) => {
  try {
    const user = await createUser(req.body);
    res.status(201).json(user);
  } catch (err) {
    res.status(400).json({ error: 'Failed to create user' });
  }
});

export default logicRouter;
