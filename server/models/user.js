const { validateHeaderValue } = require("http");
const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },

  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },

  password: {
    required: true,
    type: String,
  },

  address: {
    type: String,
    default: "",
  },

  type: {
    type: String,
    default: "user",
  },
});
const User = mongoose.model("User", userSchema);

module.exports = User;