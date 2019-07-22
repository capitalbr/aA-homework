// creating our server
const express = require("express");
const app = express();


// our connction to our db
const db = require('./config/keys').mongoURI;
const mongoose = require('mongoose');
mongoose
  .connect(db, { useNewUrlParser: true })
  .then(() => console.log("Connected to MongoDB successfully"))
  .catch(err => console.log(err));

// since our requests will be coming in JSON we will use this to parse them
// this parser can parse multiple types but we will use it to parse JSON
bodyParser = require('body-parser')

// routes
app.get("/", (req, res) => res.send("Hello Worldinobi"));

// This middleware will parse incoming JSON requests, 
// fail descriptively, and make form data available in req.body.
app.use(bodyParser.json());

// port
app.listen(5000, () => console.log('Server is running on port 5000'));