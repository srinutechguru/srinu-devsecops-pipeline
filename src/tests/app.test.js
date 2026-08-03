const request = require('supertest');
const app = require('../app/main');

describe('GET /', () => {
  it('responds with welcome message', (done) => {
    request(app)
      .get('/')
      .expect(200)
      .expect('Welcome to SRINUTECHGURU DevSecOps 60 Day Masterclass!\n', done);
  });
});
