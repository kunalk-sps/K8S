require('dotenv').config();

const express = require('express');
const app = express();
const PORT = parseInt(process.env.PORT) || 8080;

console.log('Node ENV', process.env?.NODE_ENV);

app.listen(PORT, (err) => {
    if (err) console.error(err);
    console.log(`Server up and running on PORT: ${PORT}`);
});