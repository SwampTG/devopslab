const express = require('express');
const redis = require('redis');

const app = express();
const client = redis.createClient({
  host: 'redis-server',
  port: 6379,
});

client.set('visits', 0);
app.get('/', (req, res) => {
  client.get('visits', (err, resp) => {
    let visits = parseInt(resp) + 1;
    res.send(`Number of visits is: ${visits}` )
    client.set('visits', parseInt(visits))
  })
})

app.listen(8080, () => {
  console.log('Service on 8080 port')
})
