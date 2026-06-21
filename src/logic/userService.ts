export type User = {
  id: string;
  name: string;
  email?: string;
};

const users: User[] = [];

export async function getUsers(): Promise<User[]> {
  // Simulate async I/O (e.g. DB call)
  return users;
}

export async function createUser(data: Partial<User>): Promise<User> {
  if (!data || !data.name) throw new Error('name is required');
  const user: User = {
    id: Date.now().toString(),
    name: data.name,
    email: data.email,
  };
  users.push(user);
  return user;
}
