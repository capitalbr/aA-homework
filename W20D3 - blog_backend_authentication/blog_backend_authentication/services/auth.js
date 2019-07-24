const validateInputs = require("../validation/register");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/User");
const keys = require("../config/keys");

const register = async data => {
  try {
    const { errors, isValid } = validateInputs(data);
    if (!isValid) {
      throw new Error(errors);
    }

    // why just await bcrypt and nothing else??
    const hashedPassword = await bcrypt.hash(data.password, 10);
    const user = new User(
      {
        name: data.name,
        email: data.email,
        password: hashedPassword
      },
      err => {
        if(err) throw err;
      }
    );

    user.save();

    const token = jwt.sign({ id: user.id }, keys.secretOrKey);
    const id = user._doc._id;  // why? when already have access to user.id??
    return { token, ...user._doc, id, loggedIn: true, password: null }  //why send password at all?

  } catch (err) {
    throw err;
  }
}

module.exports = { register };