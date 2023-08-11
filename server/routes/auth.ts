import { Request, Response, Router } from "express";
import User from "../models/user";
import bcrypt from "bcrypt";
import jwt from 'jsonwebtoken';
import auth from "../middleware/auth";
const authRouter = Router();

authRouter.post("/api/signup", async (req: Request, res: Response) => {
  try {
    const { name, email, password } = req.body;

    const existUser = await User.findOne({ email });

    const hashedPassword = await bcrypt.hash(password, 8);

    if (existUser) {
      return res.status(400).json({ msg: "msg - User already exists!" });
    }
    const user = await User.create({
      name,
      email,
      password: hashedPassword,
    });
    res.json(user);
  } catch (error) {
    res.status(500).json({ msg: error });
  }
});

authRouter.post("/api/signin", async (req: Request, res: Response)=> {
  try {
    const { email, password } = req.body;

    const existUser = await User.findOne({ email });

    if(!existUser){
      return res.status(400).json({msg: 'msg - User is not exist'});
    }

    const isMatch = await bcrypt.compare(password, existUser.password as string);

    if(!isMatch) {
      return res.status(400).json({msg: 'msg - Wrong password'});
    }

    const token = jwt.sign({id: existUser._id}, 'Long1234');
    
    res.json({...existUser.toJSON(),token});

  } catch (error) {
    res.status(500).json({ msg: error });
  }
});

authRouter.post("/api/validate", async (req: Request, res: Response)=> {
  try {
    const token = req.header('auth-token');
    const id = req.header('auth-id');
    console.log(token)
    console.log(id)
    if(!token || !id){
      return res.json(false);
    }

    const verified = jwt.verify(token, 'Long1234');

    if(!verified) {
      return res.json(false);
    }

    const user = await User.findById(id);

    if(!user) {
      return res.json(false);
    }

    res.json(true);
  } catch (error) {
    res.status(500).json({ msg: error });
  }
});

authRouter.get('/validate', auth, async(req, res) => {
  const user = await User.findById(req.body.user);
  console.log(user);
  res.json({...user?.toJSON(), token: req.body.token});
});

export default authRouter;
