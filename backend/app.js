const express = require('express');
const app  = express();
const routes = require('./src/routes');
const cors = require('cors');

app.use(cors());

app.get('/', routes.main);

app.listen(3333, ()=>{
    console.log('App listen port 3333');
})


