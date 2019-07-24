const Validator = require("validator");
const validText = require("./valid_text");

module.exports = function validateInputs(data) { 
  data.email = validText(data.email) ? data.email : "";
  data.name = validText(data.name) ? data.name : "";
  data.password = validText(data.password) ? data.password : "";

  let errors = [];

  if (!Validator.isEmail(data.email)) {
    errors.push("Email is invalid")
  };
  

  if (Validator.isEmpty(data.email)) {
    errors.push("Email field is required")
  };
  
  if (Validator.isEmpty(data.name)) {
    errors.push("Name field is required")
  };
  

  if (Validator.isEmpty(data.password)) {
    errors.push("Password field is required")
  };
  

  return {
    errors,
    isValid: errors.length === 0 ? true : false
  };
};