import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    require: true,
    trim: true,
  },
  email: {
    type: String,
    require: true,
    unique: true,
    validate: {
      validator: (value: String) => {
        const regex =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(regex);
      },
      message: "Enter a valid email!",
    },
  },
  password: {
    type: String,
    require: true,
    validate: {
      validator: (value: String) => {
        return value.length > 6;
      },
      message: "Password must have at least 6 characters",
    },
  },
  address: {
    type: String,
    default: "",
  },
  userType: {
    type: String,
    default: "user",
  },
});

const User = mongoose.model("users", userSchema);

export default User;
