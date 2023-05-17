// package imports:
const express = require("express");
const mongoose = require("mongoose");

// import fromrs files:
const authRouter = require("./routes/auth");

// init:
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://bgd4500:gamaa1bad@cluster0.iiwdm6n.mongodb.net/?retryWrites=true&w=majority";
// middleware
app.use(express.json());
app.use(authRouter);

app.get("/helloWorld", (req, res) => {
  res.send("hello motherfucker");
});

// connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection to database established");
  })
  .catch((e) => {
    console.log(e);
  });
app.listen(PORT, "0.0.0.0", () => {
  console.log(`server connected at ${PORT} `);
});
