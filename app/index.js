const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hello from DevOps Portfolio on ECS!'));
app.listen(port, () => console.log(`App running on port ${port}`));

res.send("Hello from updated ECS pipeline!");
