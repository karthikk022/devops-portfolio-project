const request = require('supertest');
const app = require('./app');

describe('API Tests', () => {
  test('GET /health returns healthy status', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.body.status).toBe('healthy');
  });

  test('GET /api/users returns user list', async () => {
    const res = await request(app).get('/api/users');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveLength(3);
    expect(res.body[0]).toHaveProperty('name');
  });

  test('POST /api/users creates new user', async () => {
    const res = await request(app)
      .post('/api/users')
      .send({ name: 'Test User', role: 'Tester' });
    expect(res.statusCode).toBe(201);
    expect(res.body.name).toBe('Test User');
  });

  test('POST /api/users returns 400 for missing fields', async () => {
    const res = await request(app)
      .post('/api/users')
      .send({ name: 'Test User' });
    expect(res.statusCode).toBe(400);
  });

  test('GET /api/metrics returns prometheus metrics', async () => {
    const res = await request(app).get('/api/metrics');
    expect(res.statusCode).toBe(200);
    expect(res.text).toContain('http_request_duration_seconds');
  });
});
