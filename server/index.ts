import express from "express";
import mongoose from "mongoose";
import authRouter from "./routes/auth";
import cors from 'cors';
const app = express();

app.get("/", (req, res) => {
  res.json({ dsadas: "dd" });
});

//middleware
app.use(cors({
  credentials: true,
}));
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(
    "mongodb+srv://phamlong83837:Long0938@cluster0.tjk963q.mongodb.net/amazon_clone"
  )
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((error) => {
    console.log(error);
  });

app.listen(3000, () => {
  console.log("server is running at: http://localhost:3000");
});
